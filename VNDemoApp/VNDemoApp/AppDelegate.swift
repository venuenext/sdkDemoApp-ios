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

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		/*
		 TODO: Before the VN SDK can be used, it must be initialized.
		 The `org`, `instance`, and env must be correct. You should receive these values from the VenueNext team. `env` is optional. Omit `env` to point to your production environment.
		 */
		VenueNextWeb.shared.initialize("arena", instance: "arena", env: "dev")
		
		/*
		 TODO: A .pem file is needed for authenticating user.
		 If you are planning on allowing users to log in with external accounts, the .pem file must be set. The .pem file should be received from the VenueNext team.
		 */
		if let filePath = Bundle.main.path(forResource: "arena_dev_pkcs8_private_key", ofType: "pem") {
			let fileURL = URL(fileURLWithPath: filePath)
			VenueNextWeb.shared.privateKeyPath = fileURL
		}
		
		/*
		 TODO: The user must be set with each app launch.
		 VN does not save the login. If a user is already logged in to your app, don't forget set the VN User.
		 */
		VNDemoTicketingAPI().getDemoUser { demoUser in
			if let demoUser = demoUser {
				let vnUser = User(
					demoUser.userID,
					email: demoUser.email,
					firstName: demoUser.firstName,
					lastName: demoUser.lastName,
					phoneNumber: demoUser.phoneNumber,
					provider: nil
				)
				VenueNextWeb.shared.setUser(vnUser)
			}
		}
		
		/*
		 TODO: A theme should also be configured before presenting SDK views.
		 You can use the default them (VNBaseTheme), or create a custom theme by conforming to the VNThemable protocol.
		 */
		VenueNextWeb.shared.configureTheme(VNDemoCustomTheme())
		return true
	}
}

