//
//  ProuctDetailViewContract.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public protocol ProductDetailViewContract: AnyObject {
    func display(_ viewModel: ProductDetailViewModel)
}
