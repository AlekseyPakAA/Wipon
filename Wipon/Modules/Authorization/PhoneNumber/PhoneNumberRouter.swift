//
//  PhoneNumberRouter.swift
//  Wipon
//
//  Created by Alexey Pak on 27/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit

class PhoneNumberRouter: BaseRouter {

    func showCodeModule(phoneNumber: String) {
        let controller = CodeAssembly.makeModule(using: context, phoneNumber: phoneNumber)
        context.pushViewController(controller, animated: true)
    }

}
