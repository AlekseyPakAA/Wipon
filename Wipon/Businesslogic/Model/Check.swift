//
//  Check.swift
//  Wipon
//
//  Created by Alexey Pak on 06/10/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
import ObjectMapper

struct Check: ImmutableMappable {

    let id: Int
    let status: String
    let bottledDate: Date
    let product: Product

    init(map: Map) throws {
        id = try map.value("id")
        status = try map.value("status")
        bottledDate = try map.value("bottled_at")
        product = try map.value("product")
    }

}
