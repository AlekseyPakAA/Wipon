//
//  AuthorizationService.swift
//  Wipon
//
//  Created by Alexey Pak on 23/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class AuthorizationService {

    static let shared = AuthorizationService()

    func code(phone: String, completion: @escaping (CodeResult) -> Void) {
        Alamofire.request(Router.code(phone: phone)).responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let JSON = data as? [String: Any] else {
                    fatalError("\(AuthorizationService.self): Wrong Response format, JSON is expected")
                }

                if response.response?.statusCode == 200 {
                    let resendCooldown = (JSON["resend_cooldown"] as? Int) ?? 0

                    completion(.success(resendCooldown: resendCooldown))
                } else if response.response?.statusCode == 400 {
                    let resendCooldown = (JSON["resend_cooldown"] as? Int) ?? 0

                    completion(.timeLimitation(resendCooldown: resendCooldown))
                } else {
                    completion(.failure(error: AuthorizationService.makeUnknownError()))
                }
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }

    func auth(phone: String, code: String, completion: @escaping (AuthorizationResult) -> Void) {
        Alamofire.request(Router.auth(phone: phone, code: code)).responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let JSON = data as? [String: Any] else {
                    fatalError("\(AuthorizationService.self): Wrong Response format, JSON is expected")
                }

                if response.response?.statusCode == 200 {
                    let token = (JSON["api_token"] as? String) ?? ""

                    completion(.success(token: token))
                } else if response.response?.statusCode == 400 {
                    let error = (JSON["error"] as? String) ?? ""

                    switch error {
                    case "Wrong authentication code.":
                        completion(.wrongCode)
                    case "Authentication code is expired.":
                        completion(.expiredCode)
                    default:
                        completion(.failure(error: AuthorizationService.makeUnknownError()))
                    }
                } else {
                    completion(.failure(error: AuthorizationService.makeUnknownError()))
                }
            case .failure(let error):
                completion(.failure(error: error))
            }
        }

    }

    fileprivate static func makeUnknownError() -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: "Unknown response"]
        return NSError(domain: WiponErrorDomain, code: 0, userInfo: userInfo)
    }

}

enum CodeResult {
    case success(resendCooldown: Int)
    case timeLimitation(resendCooldown: Int)
    case failure(error: Error)
}

enum AuthorizationResult {
    case success(token: String)
    case wrongCode
    case expiredCode
    case failure(error: Error)
}
