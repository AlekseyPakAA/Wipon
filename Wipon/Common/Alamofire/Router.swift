//
//  Router.swift
//  Wipon
//
//  Created by Alexey Pak on 16/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case code(phone: String)
    case auth(phone: String, code: String)
    case checks(type: String, code: String)

    static let baseURL = URL(string: "http://dev.wipon.net:8187/v1")!

    var method: HTTPMethod {
        switch self {
        case .code:
            return .post
        case .auth:
            return .post
        case .checks:
            return .post
        }
    }

    func asURLRequest() throws -> URLRequest {
        let result: (path: String, parameters: Parameters) = {
            switch self {
            case .code(let phone):
                return ("/auth", ["phone_number": phone])
            case .auth(let phone, let code):
                return ("/auth", ["phone_number": phone, "auth_code": code])
            case .checks(let type, let code):
                return ("/checks/subless", ["type": type, "code": code])
            }
        }()

        var urlRequest = URLRequest(url: Router.baseURL.appendingPathComponent(result.path))

        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        return try URLEncoding.httpBody.encode(urlRequest, with: result.parameters)
    }
}
