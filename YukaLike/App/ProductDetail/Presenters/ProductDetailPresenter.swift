//
//  ProductDetailPresenter.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public protocol ProductDetailPresenterDelegate: AnyObject {
   func productDetailPresenter(_ presenter: ProductDetailPresenter, didSelectEanCode id: String)
}

public protocol ProductDetailPresenter {
    func start()
    func didSelectTestAction(eanCode: String)
}
