//
//  SearchCoordinator.swift
//  YukaLike
//
//  Created by Renaud Cosson on 11/08/2023.
//

import Foundation
import UIKit


class BaseURLProviderImplementation: BaseURLProvider {
    var baseURL: String = "https://world.openfoodfacts.org/api/v3/product/"
}

class SearchCoordinator {

    // MARK: - Private

    private let navigationController: UINavigationController
    private var productCoordinator: ProductDetailCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start() {
        let searchViewController = SearchViewController()
        let presenter = DependencyProvider.shared.searchPresenter(viewContract: searchViewController, presenterDelegate: self)
        searchViewController.presenter = presenter
        navigationController.pushViewController(searchViewController, animated: false)
    }
}

extension SearchCoordinator: SearchPresenterDelegate {
    func searchPresenterDidScanProduct(_ presenter: SearchPresenter) {
        let coordinator = BarcodeSannerCoordinator(navigationController: navigationController)
        coordinator.start(animated: true)
    }

    func searchPresenterDidRequestProduct(_ presenter: SearchPresenter, eanCode: String) {
        let coordinator = ProductDetailCoordinator(navigationController: navigationController)
        self.productCoordinator = coordinator
        productCoordinator?.start(animated: true, eanCode: eanCode)
    }
}
