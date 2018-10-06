//
//  ViewController.swift
//  Wipon
//
//  Created by Alexey Pak on 29/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var selector = #selector(willShowKeybaord(notification: ))
        NotificationCenter.default.addObserver(self, selector: selector,
                                               name: .UIKeyboardWillShow, object: nil)

        selector = #selector(willHideKeybaord(notification: ))
        NotificationCenter.default.addObserver(self, selector: selector,
                                               name: .UIKeyboardWillHide, object: nil)
    }

    @objc fileprivate func willShowKeybaord(notification: Notification) {
        guard let frame = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect,
            let duartion = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double  else {

            return
        }

        willShowKeybaord(frame: frame, duration: duartion)
    }

    @objc fileprivate func willHideKeybaord(notification: Notification) {
        guard let frame = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect,
            let duartion = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else {

            return
        }

        willHideKeybaord(frame: frame, duration: duartion)
    }

    func willShowKeybaord(frame: CGRect, duration: TimeInterval) {

    }

    func willHideKeybaord(frame: CGRect, duration: TimeInterval) {

    }

}
