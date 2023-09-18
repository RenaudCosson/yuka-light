//
//  ProductDetailViewModelMapper.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

class ProductDetailViewModelMapper {
    public func map(product: Product, ingredients: [Ingredient]) -> ProductDetailViewModel {
        let descriptionSection = mapDescriptionSection(product: product)
        let ingredientsSection = mapIngredientsSection(ingredients: ingredients)
        return ProductDetailViewModel(sectionViewModels: [descriptionSection, ingredientsSection])
    }

    private func mapDescriptionSection(product: Product) -> ProductDetailViewModelSectionType {
        let viewModel = ProductDescriptionTableViewModel(
            productNameUILabel: product.title,
            imageProduct: product.image
        )
        return .description(viewModel)
    }

    private func mapIngredientsSection(ingredients: [Ingredient]) -> ProductDetailViewModelSectionType {
        let mapper = IngredientTableViewCellMapper()
        var viewModels = ingredients.compactMap { mapper.map(ingredient: $0) }
        return .product(viewModels)
    }
}
