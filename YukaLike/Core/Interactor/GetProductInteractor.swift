//
//  getProductInteractor.swift
//  YukaLike
//
//  Created by Renaud Cosson on 10/08/2023.
//

import Foundation

public protocol GetProductInteractor {
    func execute(product: String, completion: ((Result<Product, Error>) -> Void)?)
}
