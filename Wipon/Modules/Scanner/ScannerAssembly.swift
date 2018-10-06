//
//  ScannerAssembly.swift
//  Wipon
//
//  Created by Alexey Pak on 06/10/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation

class ScannerAssembly {

    class func makeModule(using context: NavigationContext) -> ScannerViewController {
        let router = ScannerRouter(context: context)
        let presenter = ScannerPresenter(router: router)
        let controller = ScannerViewController(presenter: presenter)

        presenter.view = controller

        return controller
    }

}
