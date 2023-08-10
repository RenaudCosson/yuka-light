//
//  RootViewPresenter.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

class RootViewPresenter {
    private weak var viewContract: RootViewContract?

    public init(viewContract: RootViewContract) {
        self.viewContract = viewContract
    }

    public func start() {
        viewContract?.display(RootViewModelMapper().map())
    }
}
