//
//  SearchRepository.swift
//  YukaLike
//
//  Created by Renaud Cosson on 10/08/2023.
//

import Foundation

public protocol SearchRepository {
    func getProduct(product: String, completion: ((Result<Product, Error>) -> Void)?)
}
