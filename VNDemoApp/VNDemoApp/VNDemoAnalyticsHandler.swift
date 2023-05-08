//
//  VNDemoAnalyticsHandler.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 12/14/22.
//

import Foundation
import VNWebSDK

class VNDemoAnalyticsHandler: VNAnalyticsProtocol {
	
	let onMessage: (String) -> Void
	
	init(onMessage: @escaping (String) -> Void) {
		self.onMessage = onMessage
	}
	
	private func createMessage(_ title: String, with attributes: [String:String]) -> String {
		var message = "\"\(title)\" {"
		attributes.forEach { (key, value) in
			message += "\r\n\t\"\(key)\": \"\(value)\""
		}
		message += "}"
		return message
	}
	
	func trackUserId(_ id: String, email: String?, name: String?) {
		let message = createMessage(
			"trackUserId",
			with: [
				"id": id,
				"email": email ?? "N/A",
				"name": name ?? "N/A"
			]
		)
		onMessage(message)
	}
	
	func trackUserAffiliations(_ affiliations: [String]) {
		let message = createMessage(
			"trackUserAffiliations",
			with: [
				"affiliations": affiliations.debugDescription
			]
		)
		onMessage(message)
	}
	
	func trackRvcSelection(itemId: String, itemName: String, itemCategory: String) {
		let message = createMessage(
			"trackRvcSelection",
			with: [
				"itemId": itemId,
				"itemName": itemName,
				"itemCategory": itemCategory
			]
		)
		onMessage(message)
	}
	
	func trackMenuItemSelection(itemId: String, itemName: String, itemCategory: String, variant: String, price: Int) {
		let message = createMessage(
			"trackMenuItemSelection",
			with: [
				"itemId": itemId,
				"itemName": itemName,
				"itemCategory": itemCategory,
				"variant": variant,
				"price": price.value
			]
		)
		onMessage(message)
	}
	
	func trackBeginCheckout() {
		let message = createMessage(
			"trackBeginCheckout",
			with: [:]
		)
		onMessage(message)
	}
	
	func trackAddItemToCart(itemId: String, itemName: String, itemCategory: String, variant: String, price: Int, quantity: Int) {
		let message = createMessage(
			"trackAddItemToCart",
			with: [
				"itemId": itemId,
				"itemName": itemName,
				"itemCategory": itemCategory,
				"variant": variant,
				"price": price.value,
				"quantity": quantity.value
			]
		)
		onMessage(message)
	}
	
	func trackRemoveItemFromCart(itemId: String, itemName: String, itemCategory: String, variant: String, price: Int, quantity: Int) {
		let message = createMessage(
			"trackRemoveItemFromCart",
			with: [
				"itemId": itemId,
				"itemName": itemName,
				"itemCategory": itemCategory,
				"variant": variant,
				"price": price.value,
				"quantity": quantity.value
			]
		)
		onMessage(message)
	}
	
	func trackCompletedPurchase(orderId: String, quantity: Int, discount: Int, tips: Int, tax: Int, total: Int, paymentTypes: String?, name: String?, email: String?) {
		let message = createMessage(
			"trackCompletedPurchase",
			with: [
				"orderId": orderId,
				"quantity": quantity.value,
				"discount": discount.value,
				"tips": tips.value,
				"tax": tax.value,
				"total": total.value,
				"paymentTypes": paymentTypes ?? "N/A",
				"name": name ?? "N/A",
				"email": email ?? "N/A"
			]
		)
		onMessage(message)
	}
	
	func trackCheckoutProgress(orderId: String, state: String) {
		let message = createMessage(
			"trackCheckoutProgress",
			with: [
				"orderId": orderId,
				"state": state
			]
		)
		onMessage(message)
	}
}
