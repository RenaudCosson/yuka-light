//
//  SearchCoordinator.swift
//  YukaLike
//
//  Created by Renaud Cosson on 11/08/2023.
//

import Foundation
import UIKit
import Alamofire

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
        let presenter = SearchPresenterImplementation(viewContract: searchViewController, delegate: self)
        searchViewController.presenter = presenter
        navigationController.pushViewController(searchViewController, animated: false)
    }
}

extension SearchCoordinator: SearchPresenterDelegate {
    func searchPresenterDidRequestProduct(_ presenter: SearchPresenter, eanCode: String) {
        let coordinator = ProductDetailCoordinator(navigationController: navigationController)
        self.productCoordinator = coordinator
        productCoordinator?.start(animated: true, eanCode: eanCode)
    }
}

class ProductDetailCoordinator {
    // MARK: - Private
    private var productCoordinator: ProductDetailCoordinator?
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start(animated: Bool, eanCode: String) {
        let viewController = ProductDetailsViewController()
        let baseUrlProvider = BaseURLProviderImplementation()
        let session = Session()
        let searchRepository = SearchNetworkRepository(
            baseURLProvider: baseUrlProvider,
            session: session
            )
        let getProductInteractor = GetProductInteractorImplementation(searchRepository: searchRepository)
        let presenter = ProductDetailPresenterImplementation(viewContract: viewController, delegate: self, getProductInteractor: getProductInteractor, eanCode: eanCode)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: animated)
    }
}

extension ProductDetailCoordinator: ProductDetailPresenterDelegate {
    func productDetailPresenter(_ presenter: ProductDetailPresenter, didSelectEanCode eanCode: String) {
        let newNavigationController = UINavigationController()
        let coordinator = ProductDetailCoordinator(navigationController: newNavigationController)
        self.productCoordinator = coordinator
        productCoordinator?.start(animated: false, eanCode: eanCode)
        navigationController.present(newNavigationController, animated: true)
    }
}
