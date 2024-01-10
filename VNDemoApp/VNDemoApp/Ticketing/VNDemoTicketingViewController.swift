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
fileprivate let TOGGLE_ANALYTICS_ENABLED = "Toggle Analytics Enabled"

class VNDemoTicketingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var demoTicketingMethodsTableView: UITableView!
	
	
	let demoTicketingAPI = VNDemoTicketingAPI()
	
	let demoMethods = [
		LOGIN,
		LOGOUT,
        TOGGLE_ANALYTICS_ENABLED
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		demoTicketingMethodsTableView.delegate = self
		demoTicketingMethodsTableView.dataSource = self
	}
	
	private func showLoginView(with user: VNDemoTicketingUser?) {
		let loginViewController = VNDemoTicketingLoginViewController()
		loginViewController.configure(user: user, onLogin: onLogin(user:))
		present(loginViewController, animated: true)
	}
	
	private func onLogin(user: VNDemoTicketingUser) {
		demoTicketingAPI.login(with: user) { loggedInUser in
			let vnUser = User(
				loggedInUser.userID,
				email: loggedInUser.email,
				firstName: loggedInUser.firstName,
				lastName: loggedInUser.lastName,
				phoneNumber: loggedInUser.phoneNumber,
				provider: loggedInUser.provider
			)
			VenueNextWeb.shared.setUser(vnUser)
			let loginMessage = UIAlertController(
				title: "Success",
				message: "\(loggedInUser.firstName) logged in successfully.",
				preferredStyle: .alert
			)
			DispatchQueue.main.async {
				self.present(loginMessage, animated: true, completion: nil)
			}
			DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
				loginMessage.dismiss(animated: true, completion: nil)
			}
		}
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
	
	/*
	 TODO: This is a contrived login/logout flow. You can use this to test with a fake user, or you can replace with your own ticketing integration to test with real users.
	 */
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let method = demoMethods[indexPath.row]
		switch(method) {
		case LOGIN:
			demoTicketingAPI.getDemoUser { demoUser in
				showLoginView(with: demoUser)
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
        case TOGGLE_ANALYTICS_ENABLED:
            let newAnalyticsEnabledStatus = !VenueNextWeb.shared.checkAnalyticsEnabledStatus()
            let toggleMessage = UIAlertController(
                title: "Status Changed",
                message: "Setting analytics enabled status to: \(newAnalyticsEnabledStatus)",
                preferredStyle: .alert
            )
            self.present(toggleMessage, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                toggleMessage.dismiss(animated: true, completion: nil)
            }
            VenueNextWeb.shared.setAnalyticsEnabled(newAnalyticsEnabledStatus)
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
