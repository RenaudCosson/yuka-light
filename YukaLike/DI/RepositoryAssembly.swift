//
//  RepositoryAssembly.swift
//  YukaLike
//
//  Created by Renaud Cosson on 11/08/2023.
//

import Foundation

import Swinject
import Alamofire

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchRepository.self) { r in
            return SearchNetworkRepository(
                baseURLProvider: r.resolve(BaseURLProvider.self)!,
                session: r.resolve(Session.self)!)
        }
    }
}
