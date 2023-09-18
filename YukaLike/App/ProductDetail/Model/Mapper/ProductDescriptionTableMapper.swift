//
//  ProductDescriptionTableMapper.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public class ProductDescriptionTableMapper {
    func map(ingredient: Ingredient) -> ProductDescriptionTableViewModel {
        return ProductDescriptionTableViewModel(
            productNameUILabel: ingredient.title,
            imageProduct: ingredient.imageProduct
        )
    }
}
