//
//  VNDemoTicketingUser.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 11/2/22.
//

import Foundation

/*
 TODO: This is a contrived example of a ticketing user for demo purposes only.
 */
class VNDemoTicketingUser: Codable {
	let userID: String
	let firstName: String
	let lastName: String
	let email: String
	let phoneNumber: String
	let provider: String
	
	init(
		userID: String,
		firstName: String,
		lastName: String,
		email: String,
		phoneNumber: String,
		provider: String
	) {
		self.userID = userID
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.phoneNumber = phoneNumber
		self.provider = provider
	}
}
