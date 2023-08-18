//
//  SearchViewModel.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public struct SearchViewModel {
    public let titleLabel: String
    public let productIdLabel: String
    public let validateButtonTitle: String

    public static let stubs: SearchViewModel = {
        return SearchViewModel(titleLabel: "Yukalight", productIdLabel: "Produit", validateButtonTitle: "Valider")
    }()
}
