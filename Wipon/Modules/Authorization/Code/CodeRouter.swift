//
//  CodeRouter.swift
//  Wipon
//
//  Created by Alexey Pak on 27/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit
class CodeRouter: BaseRouter {

    func showScannerModule() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        delegate.showScanner()
    }

}
