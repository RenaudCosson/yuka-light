//
//  RESTProductResponse.swift
//  YukaLike
//
//  Created by Renaud Cosson on 04/07/2023.
//

import Foundation

struct RESTProduct: Decodable {

    let productNameFr: String
    let brands: String
    let imageUrl: URL

    enum CodingKeys: String, CodingKey {
        case productNameFr = "product_name_fr"
        case brands
        case imageUrl = "image_url"
    }
}
