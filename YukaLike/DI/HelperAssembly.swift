//
//  HelperAssembly.swift
//  YukaLike
//
//  Created by Renaud Cosson on 16/08/2023.
//

import Foundation
import Swinject
import Alamofire

class HelperAssembly: Assembly {
    func assemble(container: Container) {

        container.register(BaseURLProvider.self) { r in
            BaseURLProviderImplementation()
        }.inObjectScope(.container)

        container.register(Session.self) { r in
            Session()
        }.inObjectScope(.container)
    }
}
