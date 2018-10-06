//
//  BaseRouter.swift
//  Wipon
//
//  Created by Alexey Pak on 27/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import UIKit

class BaseRouter {

    var context: NavigationContext

    init(context: NavigationContext) {
        self.context = context
    }

}

protocol NavigationContext {

    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    func setRootModule(_ rootModule: UIViewController, animated: Bool)

}

extension UINavigationController: NavigationContext {

    func setRootModule(_ rootModule: UIViewController, animated: Bool) {
        setViewControllers([rootModule], animated: animated)
    }

}
