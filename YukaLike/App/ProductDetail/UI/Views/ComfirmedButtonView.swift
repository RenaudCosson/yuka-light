//
//  ComfirmedButtonView.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import UIKit

private enum Constants {
    static let color = "customGreen"
}

class ComfirmedButtonView: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup

    private func setup() {
        backgroundColor = UIColor(named: Constants.color)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
            .isActive = true
    }
}
