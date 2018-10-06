//
//  AuthorizationPresenter.swift
//  Wipon
//
//  Created by Alexey Pak on 23/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
class PhoneNumberPresenter {

    weak var view: AuthorizationView?
    fileprivate let router: PhoneNumberRouter

    var phoneNumber: String = ""

    init(router: PhoneNumberRouter) {
        self.router = router
    }

    func requestAuthorizationCode() {
        view?.showActivityIndicator()
        view?.hideMessage()

        AuthorizationService.shared.code(phone: phoneNumber) {[weak self] result in
            guard let `self` = self else {
                return
            }

            switch result {
            case .success:
                self.router.showCodeModule(phoneNumber: self.phoneNumber)
            case .timeLimitation:
                self.view?.showMessage("Can't send authentication code.")
            case .failure(let error):
                self.view?.showMessage("Whoops. Something went wrong. \(error.localizedDescription)")
            }

            self.view?.hideActivityIndicator()
        }
    }

}
