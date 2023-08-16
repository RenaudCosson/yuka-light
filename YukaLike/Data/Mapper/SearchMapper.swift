//
//  SearchMapper.swift
//  YukaLike
//
//  Created by Renaud Cosson on 10/08/2023.
//

import Foundation

class SearchMapper {
    public let restProduct: RESTProduct

    init(restProduct: RESTProduct) {
        self.restProduct = restProduct
    }

    // MARK: - Public

    func map() -> Product {
        // TODO: A modifier car ingredient / id non gerer
        let noImage = URL(string: "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-15.png")
        let imageURL = restProduct.imageFrontSmallUrl ?? noImage
        return Product(
            title: restProduct.brands ?? "",
            image: imageURL,
            ingredients: []
        )
    }
}
