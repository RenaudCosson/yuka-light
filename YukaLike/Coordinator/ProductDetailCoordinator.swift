//
//  ProductDetailCoordinator.swift
//  YukaLike
//
//  Created by Renaud Cosson on 16/08/2023.
//

import Foundation
import Alamofire
import UIKit

// TODO: Ne plus tenir le productCoordinator -> Use ADCoordinator (methode add_child) #AlexHelp :D

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
        let presenter = DependencyProvider.shared.productDetailPresenter(viewContract: viewController, presenterDelegate: self, eanCode: eanCode)
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
