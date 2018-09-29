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
