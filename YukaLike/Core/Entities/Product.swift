//
//  Product.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public struct Product {
    public let id: String
    public let title: String
    public let nutriScore: URL?
    public let image: URL?

    public static let stubs = Product(
        id: "8888002076009",
        title: "coca",
        nutriScore: URL(string: "https://www.praxens.fr/wp-content/uploads/2020/06/1024px-Nutri-score-D.svg-1024x480.png"),
        image: URL(string: "https://images.openfoodfacts.org/images/products/888/800/207/6009/front_en.9.200.jpg")
    )
}
