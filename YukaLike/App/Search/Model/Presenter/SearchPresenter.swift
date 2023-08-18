//
//  SearchPresenter.swift
//  YukaLike
//
//  Created by Renaud Cosson on 11/08/2023.
//

import Foundation

protocol SearchPresenter {
    func start()
    func didSelectValidate()
    func didEndingEditing(text: String)
}

protocol SearchPresenterDelegate: AnyObject {
    func searchPresenterDidRequestProduct(_ presenter: SearchPresenter, eanCode: String)
    func searchPresenterDidScanProduct(_ presenter: SearchPresenter)
}
