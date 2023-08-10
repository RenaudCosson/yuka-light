//
//  IngredientTableViewCellModel.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/08/2023.
//

import Foundation
import UIKit

public struct IngredientTableViewCellModel {
    public let title: String
    public let percent: Double
    public let image: Data
    public let shouldRoundTopCorner: Bool
    public let shouldRoundBottomCoruner: Bool
}
