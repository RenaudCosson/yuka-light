//
//  ComfirmedButtonView.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import UIKit

class ComfirmedButtonView: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(resource: .customGreen)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
            .isActive = true
    }
}
