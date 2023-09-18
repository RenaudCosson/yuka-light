//
//  UIView.swift
//  YukaLike
//
//  Created by Renaud Cosson on 07/07/2023.
//

import Foundation
import UIKit

extension UIView {
    func customShadow() {
        self.layer.cornerRadius = 24
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    func customCorner(with customCorner: CustomCorner) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 24
        switch customCorner {
        case .top:
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
}

enum CustomCorner {
    case top, bottom
}
