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
	let phoneNumber: String?
	let provider: String?
	
	init(
		userID: String,
		firstName: String,
		lastName: String,
		email: String,
		phoneNumber: String? = nil,
		provider: String? = nil
	) {
		self.userID = userID.trimmingCharacters(in: .whitespacesAndNewlines)
		self.firstName = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
		self.lastName = lastName.trimmingCharacters(in: .whitespacesAndNewlines)
		self.email = email.trimmingCharacters(in: .whitespacesAndNewlines)
		self.phoneNumber = phoneNumber?.trimmingCharacters(in: .whitespacesAndNewlines)
		self.provider = provider?.trimmingCharacters(in: .whitespacesAndNewlines)
	}

	private enum CodingKeys: String, CodingKey {
		case userID, firstName, lastName, email, phoneNumber, provider
	}

	required convenience init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.init(
			userID: try container.decode(String.self, forKey: .userID),
			firstName: try container.decode(String.self, forKey: .firstName),
			lastName: try container.decode(String.self, forKey: .lastName),
			email: try container.decode(String.self, forKey: .email),
			phoneNumber: try container.decodeIfPresent(String.self, forKey: .phoneNumber),
			provider: try container.decodeIfPresent(String.self, forKey: .provider)
		)
	}
}
