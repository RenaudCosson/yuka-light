//
//  Ingredient.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/07/2023.
//

import Foundation

public struct Ingredient {
    let title: String
    let subtile: String
    let percent: Double
    let imageProduct: URL
    let imageNutriscore: URL

    public static let stubs: Ingredient = {
        return Ingredient(
            title: "Mock High fructose corn",
            subtile: "Mock Haagen-Dazs",
            percent: 42.0,
            imageProduct: URL(string: "https://google.fr")!,
            imageNutriscore: URL(string:"https://google.fr")!
        )
    }()
}
