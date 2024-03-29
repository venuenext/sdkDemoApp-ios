//
//  DemoTicketingAPI.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 11/2/22.
//

import Foundation

/*
 TODO: This is a contrived example of a ticketing integration.
 For best results, please test with your own ticketing integration.
 
 *** DISCLOSURE ***
 Using this fake demo api will create this user in your org.
 */
fileprivate let KEY_DEMO_LOGGED_IN_USER = "demoLoggedInUserKey"

class VNDemoTicketingAPI {
	let defaults = UserDefaults.standard
	
	func login(with userInfo: VNDemoTicketingUser, completion: (VNDemoTicketingUser) -> Void) {
		if let encoded = try? JSONEncoder().encode(userInfo) {
			defaults.setValue(encoded, forKey: KEY_DEMO_LOGGED_IN_USER)
			completion(userInfo)
		}
	}
	
	func logout(completion: () -> Void) {
		defaults.setValue(nil, forKey: KEY_DEMO_LOGGED_IN_USER)
		completion()
	}
	
	func getDemoUser(completion: (VNDemoTicketingUser?) -> Void) {
		if let data = defaults.object(forKey: KEY_DEMO_LOGGED_IN_USER) as? Data,
		   let demoTicketingUser = try? JSONDecoder()
			.decode(VNDemoTicketingUser.self, from: data) {
			completion(demoTicketingUser)
		}
		else {
			completion(nil)
		}
	}
}
