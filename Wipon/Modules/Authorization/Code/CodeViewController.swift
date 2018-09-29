//
//  CodeViewController.swift
//  Wipon
//
//  Created by Alexey Pak on 25/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit
import UIKit
import PhoneNumberKit

protocol CodeView: class {

    func showActivityIndicator()
    func hideActivityIndicator()

    func showMessage(_ message: String)
    func hideMessage()

}

class CodeViewController: UIViewController {

    fileprivate let presenter: CodePresenter

    @IBOutlet weak var codeTextField: UITextField! {
        didSet {
            codeTextField.delegate = self
        }
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!

    fileprivate let codeLength = 6

    init(presenter: CodePresenter) {
        self.presenter = presenter

        super.init(nibName: "Code", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
    }

    @IBAction func didChangeCodeTextField(sender: UITextField) {
        submitButton.isEnabled = sender.text?.count == codeLength
        presenter.code = sender.text ?? ""
    }

    @IBAction func didTouchSubmitButton(sender: UIButton) {
        presenter.requestAuthorizationToken()
    }

}

// MARK: CodeView
extension CodeViewController: CodeView {

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
extension CodeViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text ?? "") as NSString
        let resultString = text.replacingCharacters(in: range, with: string)

        if resultString.count > codeLength {
            return false
        }

        let notNumbers = NSMutableCharacterSet.decimalDigit().inverted
        let contansNotNumbers = resultString.contains {
            return  String($0).rangeOfCharacter(from: notNumbers) != nil
        }

        if contansNotNumbers {
            return false
        }

        return true
    }
}
