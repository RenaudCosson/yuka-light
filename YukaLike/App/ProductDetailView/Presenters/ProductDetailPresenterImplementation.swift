//
//  ProductDetailPresenterImplementation.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public class ProductDetailPresenterImplementation: ProductDetailPresenter {
    private let viewContract: ProductDetailViewContract?

    public init(viewContract: ProductDetailViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Public
    public func start() {
        /*
         1/ fetch les ingredients et le produit
         2/ map les viewsModels
        */
        let product: Product = .stubs
        let ingredients: [Ingredient] = []
        let viewModel = ProductDetailViewModelMapper().map(product: product, ingredients: ingredients)
        viewContract?.display(viewModel)
    }

    // MARK: - Private
}
