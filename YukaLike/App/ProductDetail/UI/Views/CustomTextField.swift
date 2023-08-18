//
//  CustomTextField.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import Foundation
import UIKit

protocol CustomTextFieldDelegate: AnyObject {
    func customTextFieldDidEndEditing(_ view: CustomeTextField, text: String)
}

class CustomeTextField: UIView, UITextFieldDelegate {
   private let textField = UITextField()
    var delegate: CustomTextFieldDelegate?

    // MARK: - UIView

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


    private func setup() {
        addSubview(textField)
        translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        clipsToBounds = true
        textField.delegate = self // Set delegate to self
        textField.placeholder = ""
        textField.clearButtonMode = .whileEditing

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 46)
        ])
    }

    // MARK: - UITextFieldDelegate

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        delegate?.customTextFieldDidEndEditing(self, text: text)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        print(updatedText)
        return true
    }
}
