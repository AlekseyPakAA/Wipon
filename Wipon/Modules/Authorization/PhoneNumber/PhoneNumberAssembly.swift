//
//  PhoneNumberAssembly.swift
//  Wipon
//
//  Created by Alexey Pak on 27/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit

class PhoneNumberAssembly {

    class func makeModule(using context: NavigationContext) -> PhoneNumberViewController {
        let router = PhoneNumberRouter(context: context)
        let presenter = PhoneNumberPresenter(router: router)
        let controller = PhoneNumberViewController(presenter: presenter)

        presenter.view = controller

        return controller
    }

}
