//
//  RootViewContract.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public protocol RootViewContract: AnyObject {
    func display(_ viewModel: RootViewModel)
}
