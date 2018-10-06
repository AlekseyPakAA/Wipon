//
//  CodeAssembly.swift
//  Wipon
//
//  Created by Alexey Pak on 27/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation

class CodeAssembly {

    class func makeModule(using context: NavigationContext, phoneNumber: String) -> CodeViewController {
        let router = CodeRouter(context: context)
        let presenter = CodePresenter(router: router, phoneNumber: phoneNumber)
        let controller = CodeViewController(presenter: presenter)

        presenter.view = controller

        return controller
    }

}
