//
//  IngredientTableViewCellMapper.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation
import UIKit

class IngredientTableViewCellMapper {
    public func map(ingredient: Ingredient) -> IngredientTableViewCellModel? {
        guard let dataProduct = try? Data(contentsOf: ingredient.imageProduct),
              let dataScore = try? Data(contentsOf: ingredient.imageNutriscore) else {
            return nil
        }
        return IngredientTableViewCellModel(
            title: ingredient.title ,
            percent: ingredient.percent,
            image: dataProduct,
            shouldRoundTopCorner: true,
            shouldRoundBottomCoruner: true
        )
    }
}
