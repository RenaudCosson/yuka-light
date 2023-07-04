//
//  RootViewController.swift
//  YukaLike
//
//  Created by Pierre Cheylus on 14/11/2022.
//

import UIKit
import ADUtils

class RootViewController: UIViewController {
    
    private lazy var titleLabel = createTitleLabel()
    private lazy var productIdLabel = createProductIdLabel()
    private lazy var productIdTextField = createProductIdTextField()
    private lazy var validateButton = createValidateButton()
    private lazy var stackView = createStackView()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        // Do the setup here.
        setupLabel()
        setupStackView()
        view.backgroundColor = UIColor(resource: .customGradiant)
    }
    
    private func setupLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupStackView() {
        view.addSubview(stackView)

        stackView.addArrangedSubview(productIdLabel)
        stackView.addArrangedSubview(productIdTextField)
        stackView.addArrangedSubview(validateButton)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 24
        stackView.layoutMargins = UIEdgeInsets(value: 24)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 208),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EYuka"
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }
    
    private func createProductIdLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrer l'identifiant produit"
        label.textColor = .gray
        return label
    }
    
    private func createProductIdTextField() -> UITextField {
        let textField = UITextField()
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "identifiant produit"
        textField.borderStyle = .roundedRect
        return textField
    }
    
    private func createValidateButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmer", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.ad_constrain(to: CGSize(width: 295, height: 44))
        button.backgroundColor = UIColor(resource: .customGreen)
        button.layer.cornerRadius = 24
        button.layer.shadowColor  = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        return button
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    @objc func action(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
    }
}
