//
//  ProductDetailCoordinator.swift
//  YukaLike
//
//  Created by Renaud Cosson on 16/08/2023.
//

import Foundation
import Alamofire
import UIKit
import ADCoordinator

// TODO: Ne plus tenir le productCoordinator -> Use ADCoordinator (methode add_child) #AlexHelp :D

class ProductDetailCoordinator: Coordinator {

    // MARK: - Private

    private unowned var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start(animated: Bool, eanCode: String) {
        let viewController = ProductDetailsViewController()
        viewController.presenter = DependencyProvider.shared.productDetailPresenter(
            viewContract: viewController, 
            presenterDelegate: self,
            eanCode: eanCode
        )
        navigationController.pushViewController(viewController, animated: animated)
        bindToLifecycle(of: viewController)
    }
}

extension ProductDetailCoordinator: ProductDetailPresenterDelegate {
    func productDetailPresenter(_ presenter: ProductDetailPresenter, didSelectEanCode eanCode: String) {
        let newNavigationController = UINavigationController()
        let coordinator = ProductDetailCoordinator(navigationController: newNavigationController)
        addChild(coordinator)
        coordinator.start(animated: false, eanCode: eanCode)
        navigationController.present(newNavigationController, animated: true)
    }
}
