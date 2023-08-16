//
//  DependencyProvider.swift
//  YukaLike
//
//  Created by Renaud Cosson on 11/08/2023.
//

import Foundation
import Swinject

class DependencyProvider {
    static let shared = DependencyProvider()

    fileprivate let presenterAssembler: Assembler

    private init() {
        self.presenterAssembler = Assembler([
            RepositoryAssembly()
        ])
    }

    // MARK: - Presenters

    func searchPresenter(viewContract: SearchViewContract,
                        presenterDelegate: SearchPresenter) -> SearchPresenter? {
        return presenterAssembler
            .resolver
            .resolve(SearchPresenter.self, arguments: viewContract, presenterDelegate)
    }
}
