//
//  RESTProductResponse.swift
//  YukaLike
//
//  Created by Renaud Cosson on 04/07/2023.
//

import Foundation

struct RESTProduct: Decodable {

    let id: String?
    let brands: String?
    let imageFrontSmallUrl: URL?
    let nutriscoreGrade: [String]?


    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case brands
        case imageFrontSmallUrl = "image_front_small_url"
        case nutriscoreGrade = "nutriscore_grade"
    }
}

struct RESTResponse: Decodable {
    let product: RESTProduct
}
