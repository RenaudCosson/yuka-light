//
//  SearchViewContract.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public protocol SearchViewContract: AnyObject {
    func display(_ viewModel: SearchViewModel)
}
