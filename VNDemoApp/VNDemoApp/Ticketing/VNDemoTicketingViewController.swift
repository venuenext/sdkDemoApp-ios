//
//  VNDemoTicketingViewController.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 11/2/22.
//

import UIKit
import VNWebSDK

fileprivate let LOGIN = "Login"
fileprivate let LOGOUT = "Logout"

class VNDemoTicketingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var demoTicketingMethodsTableView: UITableView!
	
	
	let demoTicketingAPI = VNDemoTicketingAPI()
	
	let demoMethods = [
		LOGIN,
		LOGOUT
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		demoTicketingMethodsTableView.delegate = self
		demoTicketingMethodsTableView.dataSource = self
	}
    
	func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int
	) -> Int {
		return demoMethods.count
	}
	
	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath
	) -> UITableViewCell {
		let cell = demoTicketingMethodsTableView.dequeueReusableCell(withIdentifier: "ticketingCell", for: indexPath)
		var content = cell.defaultContentConfiguration()
		content.text = demoMethods[indexPath.row]
		cell.contentConfiguration = content
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let method = demoMethods[indexPath.row]
		switch(method) {
		case LOGIN:
			demoTicketingAPI.getDemoUser { demoUser in
				if let demoUser = demoUser {
					let loggedInMessage = UIAlertController(
						title: "Already Logged In",
						message: "\(demoUser.firstName) is already logged in.",
						preferredStyle: .alert
					)
					self.present(loggedInMessage, animated: true, completion: nil)
					DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
						loggedInMessage.dismiss(animated: true, completion: nil)
					}
				}
				else {
					demoTicketingAPI.login { loggedInUser in
						let vnUser = User(
							loggedInUser.userID,
							email: loggedInUser.email,
							firstName: loggedInUser.firstName,
							lastName: loggedInUser.lastName,
							phoneNumber: loggedInUser.phoneNumber,
							provider: nil
						)
						VenueNextWeb.shared.setUser(vnUser)
						let loginMessage = UIAlertController(
							title: "Success",
							message: "\(loggedInUser.firstName) logged in successfully.",
							preferredStyle: .alert
						)
						self.present(loginMessage, animated: true, completion: nil)
						DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
							loginMessage.dismiss(animated: true, completion: nil)
						}
					}
				}
			}
		case LOGOUT:
			demoTicketingAPI.logout {
				VenueNextWeb.shared.logUserOut()
				let logoutMessage = UIAlertController(
					title: "Success",
					message: "Logged out successfully.",
					preferredStyle: .alert
				)
				self.present(logoutMessage, animated: true, completion: nil)
				DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
					logoutMessage.dismiss(animated: true, completion: nil)
				}
			}
		default:
			let unsupportedMessage = UIAlertController(
				title: "Selection Unsupported",
				message: "The \(method) method is not supported in the demo app.",
				preferredStyle: .alert
			)
			self.present(unsupportedMessage, animated: true, completion: nil)
			DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
				unsupportedMessage.dismiss(animated: true, completion: nil)
			}
		}
	}
}
