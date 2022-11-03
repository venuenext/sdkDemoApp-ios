//
//  VNDemoWalletViewController.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 11/1/22.
//

import UIKit
import VNWebSDK

fileprivate let MY_INFO = "My Info"
fileprivate let BADGE = "Badge"
fileprivate let WALLET = "Wallet"
fileprivate let SCAN_AND_PAY = "Scan And Pay"
fileprivate let VC_ACTIVITY = "Virtual Currency Activity"
fileprivate let SEND_VC = "Send Virtual Currency"
fileprivate let BENEFITS = "Benefits And Rewards"
fileprivate let PAYMENTS = "Payments"
fileprivate let SCANNER = "Scanner"
fileprivate let QR_CODE = "QR Code"
fileprivate let ORDER_HISTORY = "Order History"
fileprivate let RECEIPT = "Order Receipt"

class VNDemoWalletViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var demoWalletMethodsTableview: UITableView!
	
	let demoMethods = [
		MY_INFO,
		BADGE,
		WALLET,
		SCAN_AND_PAY,
		VC_ACTIVITY,
		SEND_VC,
		BENEFITS,
		PAYMENTS,
		SCANNER,
		QR_CODE,
		ORDER_HISTORY,
		RECEIPT
	]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		demoWalletMethodsTableview.delegate = self
		demoWalletMethodsTableview.dataSource = self
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
		let cell = demoWalletMethodsTableview.dequeueReusableCell(withIdentifier: "walletCell", for: indexPath)
		var content = cell.defaultContentConfiguration()
		content.text = demoMethods[indexPath.row]
		cell.contentConfiguration = content
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let method = demoMethods[indexPath.row]
		switch(method) {
		case MY_INFO:
			navigationController?.pushMyInfo()
		case BADGE:
			navigationController?.pushBadge()
		case WALLET:
			navigationController?.pushWallet()
		case SCAN_AND_PAY:
			navigationController?.pushScanAndPay()
		case VC_ACTIVITY:
			navigationController?.pushVirtualCurrencyActivity()
		case SEND_VC:
			navigationController?.pushSendVirtualCurrency()
		case BENEFITS:
			navigationController?.pushBenefitsAndRewards()
		case PAYMENTS:
			navigationController?.pushPayments()
		case SCANNER:
			navigationController?.pushScanner()
		case QR_CODE:
			navigationController?.pushQrCode()
		case ORDER_HISTORY:
			navigationController?.pushOrderHistory()
		case RECEIPT:
			/*
			 TODO: Update the order UUID to test with a real receipt for configuration.
			 */
			navigationController?.pushOrderReceipt(receipt: "<ORDER_UUID>")
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
