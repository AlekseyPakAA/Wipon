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

        let navigationController = UINavigationController()
        let controller = PhoneNumberAssembly.makeModule(using: navigationController)
        navigationController.setViewControllers([controller], animated: true)

        window.rootViewController = navigationController

        window.makeKeyAndVisible()

        self.window = window

        return true
    }

}

// MARK: - Routing
extension AppDelegate {

    func showScanner() {
        guard let window = window else {
            return
        }

        let navigationController = UINavigationController()
        let controller = ScannerAssembly.makeModule(using: navigationController)
        navigationController.setViewControllers([controller], animated: true)

        window.rootViewController = navigationController
        UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }

}
