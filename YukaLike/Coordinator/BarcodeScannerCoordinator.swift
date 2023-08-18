//
//  BarcodeScannerCoordinator.swift
//  YukaLike
//
//  Created by Renaud Cosson on 16/08/2023.
//

import Foundation
import Alamofire
import UIKit
import ADCoordinator

class BarcodeSannerCoordinator: Coordinator {
    // MARK: - Private
    private var productCoordinator: ProductDetailCoordinator?
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start(animated: Bool) {
        let viewController = BarcodeScannerViewController()
        navigationController.pushViewController(viewController, animated: animated)
    }
}
