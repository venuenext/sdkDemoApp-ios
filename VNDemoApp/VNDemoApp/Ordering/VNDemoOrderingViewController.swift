//
//  VNDemoOrderingViewController.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 11/1/22.
//

import UIKit
import VNWebSDK
import OSLog

fileprivate let BASIC_FB = "Presenting Basic Food And Beverage"
fileprivate let FILTERING_SERVICE_TYPE = "Filtering Food And Beverage Service Types"
fileprivate let ADVANCED_FILTERING = "Advanced Food and Merchandise Filtering"
fileprivate let ADVANCED_OPTIONS = "Presenting Specific Menus with Options"

fileprivate let ALL_RVCS = "Show All Revenue Centers"
fileprivate let ALL_FOOD = "Show All Food And Beverage Menus"
fileprivate let SPECIFIC_FOOD = "Show A Specific Food And Beverage Menu"
fileprivate let ALL_MERCH = "Show All Merchandise Menus"
fileprivate let SPECIFIC_MERCH = "Show A Specific Merchandise Menu"
fileprivate let ALL_EXPERIENCE = "Show All Experience Menus"
fileprivate let SPECIFIC_EXPERIENCE = "Show A Specific Experience Menu"

fileprivate let PICKUP = "Filter For Pickup"
fileprivate let DELIVERY = "Filter For Delivery"

fileprivate let ADVANCED_FILTERING_RVCS = "All Revenue Centers Advanced Filtering"
fileprivate let ADVANCED_FILTERING_FOOD = "All Food And Beverage Advanced Filtering"
fileprivate let ADVANCED_FILTERING_MERCH = "All Merchandise Advanced Filtering"

fileprivate let SPECIFIC_FOOD_ITEM = "Show A Specific Food Item"
fileprivate let SPECIFIC_MERCH_ITEM = "Show A Specific Merchandise Item"
fileprivate let SPECIFIC_EXPERIENCE_EVENT = "Show A Specific Experience Menu With An Event Pre-Populated"
fileprivate let SPECIFIC_EXPERIENCE_EVENT_DETAILS = "Show A Detail View For And Experience Item"

class VNDemoOrderingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var demoOrderingMethodsTableview: UITableView!
	
	let demoBasicFoodAndBevMethods = [
		ALL_RVCS,
		ALL_FOOD,
		SPECIFIC_FOOD,
		ALL_MERCH,
		SPECIFIC_MERCH,
		ALL_EXPERIENCE,
		SPECIFIC_EXPERIENCE
	]
	
	let demoServiceTypeFilteringMethods = [
		PICKUP,
		DELIVERY
	]
	let demoAdvancedFilteringMethods = [
		ADVANCED_FILTERING_RVCS,
		ADVANCED_FILTERING_FOOD,
		ADVANCED_FILTERING_MERCH
	]
	
	let demoAdvancedOptionsMethods = [
		SPECIFIC_FOOD_ITEM,
		SPECIFIC_MERCH_ITEM,
		SPECIFIC_EXPERIENCE_EVENT,
		SPECIFIC_EXPERIENCE_EVENT_DETAILS,
	]
	
	lazy var demoSections = [
		(section: demoBasicFoodAndBevMethods, title: BASIC_FB),
		(section: demoServiceTypeFilteringMethods, title: FILTERING_SERVICE_TYPE),
		(section: demoAdvancedFilteringMethods, title: ADVANCED_FILTERING),
		(section: demoAdvancedOptionsMethods, title: ADVANCED_OPTIONS)
	]
	
	lazy var demoAnalyticsHandler = VNDemoAnalyticsHandler { message in
		os_log("Analytics Message: \(message)")
		let alert = UIAlertController(
			title: "VN Analytics Event",
			message: message,
			preferredStyle: .alert
		)
		 self.present(alert, animated: true, completion: nil)
		 Timer.scheduledTimer(
			withTimeInterval: 5.0,
			repeats: false,
			block: { _ in alert.dismiss(animated: true, completion: nil)}
		)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		demoOrderingMethodsTableview.delegate = self
		demoOrderingMethodsTableview.dataSource = self
		VenueNextWeb.shared.configureAnalytics(demoAnalyticsHandler)
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		demoSections.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		demoSections[section].title
	}
	
	func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int
	) -> Int {
		return demoSections[section].section.count
	}
	
	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath
	) -> UITableViewCell {
		let cell = demoOrderingMethodsTableview.dequeueReusableCell(withIdentifier: "orderingCell", for: indexPath)
		var content = cell.defaultContentConfiguration()
		content.text = demoSections[indexPath.section].section[indexPath.row]
		cell.contentConfiguration = content
		return cell
	}
	
	/*
	 TODO: Update the UUID and name strings in these VN calls with real values to properly test these flows.
	 */
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let method = demoSections[indexPath.section].section[indexPath.row]
		switch(method) {
		case ALL_RVCS:
			navigationController?.pushRVCS()
		case ALL_FOOD:
			navigationController?.pushFnB()
		case SPECIFIC_FOOD:
			navigationController?.pushFnBMenu(menu: "<MENU_UUID>")
		case ALL_MERCH:
			navigationController?.pushMerchandise()
		case SPECIFIC_MERCH:
			navigationController?.pushMerchandiseMenu(menu: "<MENU_UUID>")
		case ALL_EXPERIENCE:
			navigationController?.pushExperiences()
		case SPECIFIC_EXPERIENCE:
			navigationController?.pushExperienceMenu(menu: "<MENU_UUID>", event: nil)
		case PICKUP:
			navigationController?.pushFnB(serviceType: .pickup)
		case DELIVERY:
			navigationController?.pushFnB(serviceType: .delivery)
		case ADVANCED_FILTERING_RVCS:
			navigationController?.pushRVCS(
			  noWaitTimes: true,
			  serviceType: .delivery,
			  locations: ["<LOCATION_NAME>", "<LOCATION_NAME>"],
			  categories: ["<CATEGORY_NAME>", "<CATEGORY_NAME>"]
			)
		case ADVANCED_FILTERING_FOOD:
			navigationController?.pushFnB(
			  noWaitTimes: true,
			  serviceType: .pickup,
			  locations: ["<LOCATION_NAME>", "<LOCATION_NAME>"],
			  categories: ["<CATEGORY_NAME>", "<CATEGORY_NAME>"]
			)
		case ADVANCED_FILTERING_MERCH:
			navigationController?.pushMerchandise(
			  noWaitTimes: true,
			  serviceType: .delivery,
			  locations: ["<LOCATION_NAME>", "<LOCATION_NAME>"],
			  categories: ["<CATEGORY_NAME>", "<CATEGORY_NAME>"]
			)
		case SPECIFIC_FOOD_ITEM:
			navigationController?.pushFoodMenuItem(
				menu: "<MENU_UUID>",
				item: "<ITEM_UUID>"
			)
		case SPECIFIC_MERCH_ITEM:
			navigationController?.pushMerchandiseMenuItem(
				menu: "<MENU_UUID>",
				item: "<ITEM_UUID>"
			)
		case SPECIFIC_EXPERIENCE_EVENT:
			navigationController?.pushExperienceMenu(
				menu: "<MENU_UUID>",
				event: "<EVENT_UUID>"
			)
		case SPECIFIC_EXPERIENCE_EVENT_DETAILS:
			navigationController?.pushExperienceDetails(
				menu: "<MENU_UUID>",
				item: "<ITEM_UUID>",
				event: "<EVENT_UUID>",
				variant: "<VARIANT_UUID>")
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


