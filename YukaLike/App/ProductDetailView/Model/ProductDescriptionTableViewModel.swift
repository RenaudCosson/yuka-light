//
//  ProductDescriptionTableViewModel.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation
import UIKit

public struct ProductDescriptionTableViewModel {
    public let productNameUILabel: String
    public let imageProduct: URL?
//    public let imageNutriscore: UIImage?

    public static let empty: ProductDescriptionTableViewModel = {
        return ProductDescriptionTableViewModel(
            productNameUILabel: "",
            imageProduct: nil
//            imageNutriscore: nil
        )
    }()
}
