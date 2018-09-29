//
//  AuthorizationViewController.swift
//  Wipon
//
//  Created by Alexey Pak on 15/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit
import PhoneNumberKit

protocol AuthorizationView: class {

    func showActivityIndicator()
    func hideActivityIndicator()

    func showMessage(_ message: String)
    func hideMessage()

}

class PhoneNumberViewController: UIViewController {

    fileprivate let presenter: PhoneNumberPresenter

    @IBOutlet weak var phoneNumberTextField: PhoneNumberTextField! {
        didSet {
            phoneNumberTextField.defaultRegion = Locale(identifier: "en_RU").regionCode!
            phoneNumberTextField.delegate = self
            phoneNumberTextField.text = "+7"
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!

    init(presenter: PhoneNumberPresenter) {
        self.presenter = presenter

        super.init(nibName: "PhoneNumber", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.isEnabled = phoneNumberTextField.isValidNumber

        presenter.view = self
    }

    @IBAction func didChangePhoneNumberTextField(sender: PhoneNumberTextField) {
        signInButton.isEnabled = sender.isValidNumber
        presenter.phoneNumber = sender.rawPhoneNumber ?? ""
    }

    @IBAction func didTouchSignInButton(sender: UIButton) {
        if phoneNumberTextField.isValidNumber {
            presenter.requestAuthorizationCode()
        }
    }

}

// MARK: AuthorizationView
extension PhoneNumberViewController: AuthorizationView {

    func hideMessage() {
        messageLabel.isHidden = true
    }

    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }

    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }

    func showMessage(_ message: String) {
        messageLabel.isHidden = false
        messageLabel.text = message
    }

}

// MARK: UITextFieldDelegate
extension PhoneNumberViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if range.location == 0 || range.location == 1 {
            return false
        }

        return true
    }

}
