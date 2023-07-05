//
//  Request.swift
//  YukaLike
//
//  Created by Renaud Cosson on 04/07/2023.
//

import Foundation

struct Endpoint {
    let path: String
}

extension Endpoint {
    static func productInfo(productId: String) -> Endpoint {
        return Endpoint(path: "https://world.openfoodfacts.org/api/v3/product/\(productId)")
    }
}
