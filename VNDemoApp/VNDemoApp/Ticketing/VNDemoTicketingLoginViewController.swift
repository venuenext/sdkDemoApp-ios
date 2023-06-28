//
//  VNDemoTicketingLoginViewController.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 6/28/23.
//

import UIKit

class VNDemoTicketingLoginViewController: UIViewController {
	
	@IBOutlet weak var idTextField: UITextField!
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var providerTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	
	private var demoUser: VNDemoTicketingUser? = nil
	
	var onLogin: ((_ user: VNDemoTicketingUser) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
		loginButton.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
		setTextFieldText(text: demoUser?.userID ?? "", textField: idTextField)
		setTextFieldText(text: demoUser?.firstName ?? "", textField: firstNameTextField)
		setTextFieldText(text: demoUser?.lastName ?? "", textField: lastNameTextField)
		setTextFieldText(text: demoUser?.email ?? "", textField: emailTextField)
		setTextFieldText(text: demoUser?.phoneNumber ?? "", textField: phoneTextField)
		setTextFieldText(text: demoUser?.provider ?? "", textField: providerTextField)
		let tap = UITapGestureRecognizer(
			target: self,
			action: #selector(UIInputViewController.dismissKeyboard)
		)
		view.addGestureRecognizer(tap)
    }

	func configure(
		user: VNDemoTicketingUser?,
		onLogin: @escaping (_ user: VNDemoTicketingUser) -> Void
	) {
		self.demoUser = user
		self.onLogin = onLogin
	}
	
	func setTextFieldText(text: String?, textField: UITextField) {
		if let text = text, text.isEmpty == false {
			textField.text = text
		}
	}
	
	@objc func onLoginTapped() {
		let demoUser = VNDemoTicketingUser(
			userID: idTextField.text ?? "",
			firstName: firstNameTextField.text ?? "",
			lastName: lastNameTextField.text ?? "",
			email: emailTextField.text ?? "",
			phoneNumber: phoneTextField.text ?? "",
			provider: providerTextField.text ?? ""
		)
		onLogin?(demoUser)
		dismiss(animated: true)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}
