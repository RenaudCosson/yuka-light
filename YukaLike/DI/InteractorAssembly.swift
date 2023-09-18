//
//  InteractorAssembly.swift
//  YukaLike
//
//  Created by Renaud Cosson on 16/08/2023.
//

import Foundation
import Swinject

class InteractorAssembly: Assembly {
    func assemble(container: Container) {

        container.register(GetProductInteractor.self) { r in
            GetProductInteractorImplementation(
                searchRepository: r.resolve(SearchRepository.self)!
            )
        }.inObjectScope(.container)
    }
}
