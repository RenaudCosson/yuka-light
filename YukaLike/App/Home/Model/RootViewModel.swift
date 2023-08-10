//
//  RootViewModel.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation

public struct RootViewModel {
    public let titleLabel: String
    public let productIdLabel: String
    public let validateButtonTitle: String

    public static let stubs: RootViewModel = {
        return RootViewModel(titleLabel: "Yukalight", productIdLabel: "Product EAN", validateButtonTitle: "Valider")
    }()
}
