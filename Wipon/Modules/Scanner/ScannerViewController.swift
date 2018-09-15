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

class ScannerViewController: RSCodeReaderViewController {

	@IBOutlet weak var barCodeContentLabel: UILabel?

	override func viewDidLoad() {
		super.viewDidLoad()

		self.focusMarkLayer.strokeColor = UIColor.red.cgColor

		self.cornersLayer.strokeColor = UIColor.yellow.cgColor

		self.tapHandler = { point in
			print(point)
		}

		self.barcodesHandler = { barcodes in
			DispatchQueue.main.async { [weak self] in
				self?.barCodeContentLabel?.text = barcodes.first?.stringValue
			}
		}
	}

}
