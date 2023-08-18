//
//  PresenterAssembly.swift
//  YukaLike
//
//  Created by Renaud Cosson on 16/08/2023.
//

import Foundation
import Swinject

class PresenterAssembly: Assembly {
    func assemble(container: Container) {

        container.register(SearchPresenter.self) { r, viewContract, delegate in
            SearchPresenterImplementation(
                viewContract: viewContract,
                delegate: delegate
            )
        }

        container.register(ProductDetailPresenter.self) { r, viewContract, delegate, eanCode in
            ProductDetailPresenterImplementation(
                viewContract: viewContract,
                delegate: delegate,
                getProductInteractor: r.resolve(GetProductInteractor.self)!,
                eanCode: eanCode
            )
        }
    }
}
