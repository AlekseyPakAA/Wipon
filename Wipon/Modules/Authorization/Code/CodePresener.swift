//
//  CodePresener.swift
//  Wipon
//
//  Created by Alexey Pak on 25/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation

class CodePresenter {

    weak var view: CodeView?
    fileprivate let router: CodeRouter

    let phoneNumber: String
    var code: String = ""

    init(router: CodeRouter, phoneNumber: String) {
        self.router = router
        self.phoneNumber = phoneNumber
    }

    func requestAuthorizationToken() {
        view?.showActivityIndicator()
        view?.hideMessage()

        AuthorizationService.shared.auth(phone: phoneNumber, code: code) { result in
            switch result {
            case .success(let token):
                UserDefaultsManager.shared.authorizationToken = token
            case .wrongCode:
                self.view?.showMessage("Authorization code is wrong.")
            case .expiredCode:
                self.view?.showMessage("Authorization code is expired.")
            case .failure(let error):
                self.view?.showMessage("Whoops. Something went wrong. \(error.localizedDescription)")
            }

            self.view?.hideActivityIndicator()
        }
    }

}
