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
       
        let imageURL = URL(string: restProduct.imageFrontSmallUrl ?? "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-15.png")
        return Product(
            title: restProduct.brands,
            nutriScore: restProduct.nutriscoreGrade,
            image: imageURL,
            ingredients: []
        )
    }
}
