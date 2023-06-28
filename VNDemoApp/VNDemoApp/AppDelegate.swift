//
//  AppDelegate.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 11/1/22.
//

import UIKit
import VNWebSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	lazy var rootViewController: UIViewController? = {
		return (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController
	}()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		/*
		 TODO: Before the VN SDK can be used, it must be initialized.
		 The `org`, `instance`, and env must be correct. You should receive these values from the VenueNext team. `env` is optional. Omit `env` to point to your production environment, or include it to point to other environments, like "qa" or "dev" (the environment must be created by VN, however).
		 */
		VenueNextWeb.shared.initialize("<YOUR_VN_ORG>", instance: "<YOU_VN_INSTANCE>")
		
		/*
		 TODO: A .pem file is needed for authenticating user.
		 If you are planning on allowing users to log in with external accounts, the .pem file must be set. The .pem file should be received from the VenueNext team. You will need to import your .pem file to Xcode.
		 */
		if let filePath = Bundle.main.path(forResource: "<YOUR_PEM_FILE_NAME>", ofType: "pem") {
			let fileURL = URL(fileURLWithPath: filePath)
			VenueNextWeb.shared.privateKeyPath = fileURL
		}
		
		/*
		 TODO: The user must be set with each app launch.
		 VN does not save the login. If a user is already logged in to your app, don't forget set the VN User. You can experiment with this fake user and contrived ticketing API, or implement your own ticketing integration here.
		 > Note: See "External login providers" in the VN SDK documentation for more info on supported providers.
		 > https://venuenext.github.io/ios-2/quick-start-guide/
		 */
		VNDemoTicketingAPI().getDemoUser { demoUser in
			if let demoUser = demoUser {
				let vnUser = User(
					demoUser.userID,
					email: demoUser.email,
					firstName: demoUser.firstName,
					lastName: demoUser.lastName,
					phoneNumber: demoUser.phoneNumber,
					provider: demoUser.provider
				)
				VenueNextWeb.shared.setUser(vnUser)
			}
		}
		
		/*
		 TODO: A theme should also be configured before presenting SDK views.
		 You can use the default them (VNBaseTheme), or create a custom theme by conforming to the VNThemable protocol. Experiment with custom theming by editing the VNDemoCustomTheme class.
		 */
		VenueNextWeb.shared.configureTheme(VNDemoCustomTheme())
		return true
	}
	
	public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		guard let presenter = rootViewController else {
			return false
		}

		let canHandle = VenueNextWeb.canHandle(url: url)

		if canHandle {
			VenueNextWeb.handle(url: url, presenter: presenter, completion: nil)
		}

		return canHandle
	}
}

