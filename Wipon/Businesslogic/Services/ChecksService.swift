//
//  ChecksService.swift
//  Wipon
//
//  Created by Alexey Pak on 06/10/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ChecksService {

    static let shared = ChecksService()

    func checks(type: String, code: String, completion: @escaping (AuthorizationResult) -> Void) {
        
    }

}

enum ChecksResult {
    case success(result: Int)
    case failure(error: Error)
}
