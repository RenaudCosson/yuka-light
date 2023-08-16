//
//  ProductDetailPresenterImplementation.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public class ProductDetailPresenterImplementation: ProductDetailPresenter {

    private let viewContract: ProductDetailViewContract?
    private weak var delegate: ProductDetailPresenterDelegate?
    private let getProductInteractor: GetProductInteractor
    private let eanCode: String?

    public init(viewContract: ProductDetailViewContract, delegate: ProductDetailPresenterDelegate, getProductInteractor: GetProductInteractor, eanCode: String) {
        self.viewContract = viewContract
        self.delegate = delegate
        self.getProductInteractor = getProductInteractor
        self.eanCode = eanCode
    }

    // MARK: - Public
    public func start() {
        guard let eanCode = eanCode else { return }
        getProductInteractor.execute(eanCode: eanCode) { result in
            switch result {
            case .success(let product):
                let viewModel = ProductDetailViewModelMapper().map(product: product, ingredients: [])
                self.viewContract?.display(viewModel)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

    public func didSelectTestAction(eanCode: String) {
        delegate?.productDetailPresenter(self, didSelectEanCode: eanCode)
    }
}
