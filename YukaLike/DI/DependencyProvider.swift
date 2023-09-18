//
//  DependencyProvider.swift
//  YukaLike
//
//  Created by Renaud Cosson on 11/08/2023.
//

import Foundation
import Swinject


class DependencyProvider: NSObject {
    static let shared = DependencyProvider()
    private let container = Container()
    private let resolver: Swinject.Resolver

    private override init() {
        let assemblies: [Assembly] = [
            RepositoryAssembly(),
            PresenterAssembly(),
            HelperAssembly(),
            InteractorAssembly()
        ]
        resolver = container.synchronize()
        super.init()
        assemblies.forEach({$0.assemble(container: container)})
        assemblies.forEach({$0.loaded(resolver: resolver)})
    }

    // MARK: - Presenters

    func searchPresenter(viewContract: SearchViewContract,
                        presenterDelegate: SearchPresenterDelegate) -> SearchPresenter {
        return resolver
            .resolve(
                SearchPresenter.self,
                arguments: viewContract, presenterDelegate
            )!
    }

    func productDetailPresenter(viewContract: ProductDetailViewContract,
                                presenterDelegate: ProductDetailPresenterDelegate,
                                eanCode: String) -> ProductDetailPresenter {
        return resolver
            .resolve(
                ProductDetailPresenter.self,
                     arguments: viewContract, presenterDelegate, eanCode
            )!
    }
}
