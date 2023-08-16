//
//  CustomTextField.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import Foundation
import UIKit

class CustomeTextField: UITextField, UITextFieldDelegate {
    let textField = UITextField()

    // MARK: - UIView

    override func layoutSubviews() {
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


    private func setup() {
        addSubview(textField)
        translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        clipsToBounds = true
        textField.delegate = self // Set delegate to self

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 46)
        ])
    }

    // MARK: - UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        // You can now use updatedText for whatever you want
        print(updatedText)
        return true
    }
}
