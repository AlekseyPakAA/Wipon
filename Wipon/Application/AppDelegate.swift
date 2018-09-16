//
//  AppDelegate.swift
//  Wipon
//
//  Created by Alexey Pak on 15/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.

		let window = UIWindow()

		let rootViewController = UIStoryboard(name: "Authorization", bundle: nil).instantiateInitialViewController()
		window.rootViewController = rootViewController

		window.makeKeyAndVisible()

		self.window = window

		Alamofire.request(Router.code(phone: "+79895066096")).responseString { response in
			switch response.result {
			case .success(let data):
				print("success: \(data)")
			case .failure(let error):
				print("failure: \(error.localizedDescription)")
			}
		}

//		Alamofire.request(Router.auth(phone: "+79895066096", code: "368619")).validate().responseString { response in
//			switch response.result {
//			case .success(let data):
//				print("success: \(data)")
//			case .failure(let error):
//				print("failure: \(error.localizedDescription)")
//			}
//		}

		return true
	}

}
