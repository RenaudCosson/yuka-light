//
//  getProductInteractorImplementation.swift
//  YukaLike
//
//  Created by Renaud Cosson on 10/08/2023.
//

import Foundation

public class GetProductInteractorImplementation: GetProductInteractor {

    private let searchRepository: SearchRepository

    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }

    public func execute(product: String, completion: ((Result<Product, Error>) -> Void)?) {
        // TODO: A implementer
        searchRepository.getProduct(product: product, completion: completion)
    }
}
