//
//  ScannerPresenter.swift
//  Wipon
//
//  Created by Alexey Pak on 06/10/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
class ScannerPresenter {

    weak var view: ScannerView?
    fileprivate let router: ScannerRouter

    init(router: ScannerRouter) {
        self.router = router
    }

}
