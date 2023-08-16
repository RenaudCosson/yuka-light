//
//  SearchPresenterImplementation.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

class SearchPresenterImplementation: SearchPresenter {

    private weak var delegate: SearchPresenterDelegate?
    private weak var viewContract: SearchViewContract?

    public init(viewContract: SearchViewContract, delegate: SearchPresenterDelegate) {
        self.viewContract = viewContract
        self.delegate = delegate
    }

    public func start() {
        viewContract?.display(SearchViewModelMapper().map())
    }

    func didSelectValidate(eanCode: String) {
        delegate?.searchPresenterDidRequestProduct(self, eanCode: eanCode)
    }
}
