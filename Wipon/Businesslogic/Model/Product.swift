//
//  Product.swift
//  Wipon
//
//  Created by Alexey Pak on 06/10/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
import ObjectMapper

struct Product: ImmutableMappable {

    let name: String
    let type: String
    let orgatization: String

    init(map: Map) throws {
        name = try map.value("name")
        type = try map.value("type")
        orgatization = try map.value("orgatization")
    }

}
