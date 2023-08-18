//
//  SearchCoordinator.swift
//  YukaLike
//
//  Created by Renaud Cosson on 11/08/2023.
//

import Foundation
import UIKit
import ADCoordinator


class BaseURLProviderImplementation: BaseURLProvider {
    var baseURL: String = "https://world.openfoodfacts.org/cgi/search.pl?search_terms="
}

class SearchCoordinator: Coordinator {

    // MARK: - Private

    private unowned var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start() {
        let viewController = SearchViewController()
        viewController.presenter = DependencyProvider.shared.searchPresenter(
            viewContract: viewController,
            presenterDelegate: self
        )
        navigationController.pushViewController(viewController, animated: true)
        bindToLifecycle(of: viewController)
    }
}

extension SearchCoordinator: SearchPresenterDelegate {
    func searchPresenterDidScanProduct(_ presenter: SearchPresenter) {
        let coordinator = BarcodeSannerCoordinator(navigationController: navigationController)
        coordinator.start(animated: true)
    }

    func searchPresenterDidRequestProduct(_ presenter: SearchPresenter, eanCode: String) {
        let coordinator = ProductDetailCoordinator(navigationController: navigationController)
        addChild(coordinator)
        coordinator.start(animated: true, eanCode: eanCode)
    }
}
