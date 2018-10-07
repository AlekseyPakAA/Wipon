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

class CheckService {

    enum Result {
        case success(data: Check)
        case storeNotFound
        case serviceUnavailable
        case failure(error: Error)
    }

    static let shared = CheckService()

    func checks(type: String, code: String, completion: @escaping (CheckService.Result) -> Void) {
        Alamofire.request(Router.checks(type: type, code: code)).responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let JSON = data as? [String: Any] else {
                    fatalError("\(CheckService.self): Wrong Response format, JSON expected")
                }

                if response.response?.statusCode == 200 {
                    guard let check = try? Check(JSON: JSON) else {
                        fatalError("\(CheckService.self): Can't parse response")
                    }

                    completion(.success(data: check))
                } else {
                    let error = (JSON["error"] as? String) ?? ""

                    switch error {
                    case "Store not found.":
                        completion(.storeNotFound)
                    case "SRC service unavailable.":
                        completion(.serviceUnavailable)
                    default:
                        completion(.failure(error: NetworkUtils.makeUnknownError()))
                    }
                }
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }

}
