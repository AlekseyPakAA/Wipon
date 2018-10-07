//
//  NetworkUtils.swift
//  Wipon
//
//  Created by Alexey Pak on 06/10/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation

class NetworkUtils {

    static func makeUnknownError() -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: "Unknown response"]
        return NSError(domain: WiponErrorDomain, code: 0, userInfo: userInfo)
    }

}
