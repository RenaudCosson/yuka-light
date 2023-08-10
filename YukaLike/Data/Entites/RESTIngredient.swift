//
//  RESTIngredient.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/07/2023.
//

import Foundation
import UIKit

struct RESTIngredient {
    let title: String?
    let subtile: String?
    let percent: Double?
    let imageProduct: URL?
    let imageNutriscore: URL?

    enum CodingKeys: String, CodingKey {
        case title
        case subtile
        case percent
        case imageProduct
        case imageNutriscore
    }
}
