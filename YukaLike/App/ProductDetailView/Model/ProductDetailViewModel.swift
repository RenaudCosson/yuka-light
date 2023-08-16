//
//  ProductDetailViewModel.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public enum ProductDetailViewModelSectionType {
    case description(ProductDescriptionTableViewModel)
    case product([IngredientTableViewCellModel])
}

public struct ProductDetailViewModel {
    public var sectionViewModels: [ProductDetailViewModelSectionType]
    static let empty = ProductDetailViewModel(sectionViewModels: [])
}
