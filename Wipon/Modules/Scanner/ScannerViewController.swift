//
//  ScannerViewController.swift
//  Wipon
//
//  Created by Alexey Pak on 15/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit
import RSBarcodes_Swift
import AVFoundation

protocol ScannerView: class {

}

class ScannerViewController: RSCodeReaderViewController {

    fileprivate let presenter: ScannerPresenter

    init(presenter: ScannerPresenter) {
        self.presenter = presenter

        super.init(nibName: "Scanner", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true

        self.focusMarkLayer.strokeColor = UIColor.red.cgColor
        self.cornersLayer.strokeColor = UIColor.yellow.cgColor
    }

}

// MARK: ScannerView
extension ScannerViewController: ScannerView {

}
