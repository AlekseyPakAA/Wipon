//
//  UserDefaultsManager.swift
//  Wipon
//
//  Created by Alexey Pak on 29/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
final class UserDefaultsManager {

    private struct Keys {
        static let authorizationToken = "kAuthorizationToken"
    }

    static let shared = UserDefaultsManager()

    var authorizationToken: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.authorizationToken)
            UserDefaults.standard.synchronize()
        }

        get {
            return UserDefaults.standard.string(forKey: Keys.authorizationToken)
        }
    }

}
