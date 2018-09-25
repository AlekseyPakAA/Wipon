//
//  AuthorizationPresenter.swift
//  Wipon
//
//  Created by Alexey Pak on 23/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
class AuthorizationPresenter {

	weak var view: AuthorizationView?

	func requestAuthorizationCode(phoneNumber: String) {
		view?.showActivityIndicator()
		view?.hideMessage()

		AuthorizationService.shared.code(phone: phoneNumber) {[weak self] result in
			guard let `self` = self else {
				return
			}

			switch result {
			case .success:
				break
			case .timeLimitation:
				self.view?.showMessage("Can't send authentication code.")
			case .failure(let error):
				self.view?.showMessage("Whoops. Something went wrong. \(error.localizedDescription)")
			}

			self.view?.hideActivityIndicator()
		}
	}

}
