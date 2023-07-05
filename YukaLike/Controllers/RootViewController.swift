//
//  RootViewController.swift
//  YukaLike
//
//  Created by Pierre Cheylus on 14/11/2022.
//

import UIKit
//import ADUtils

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
    
    override func viewDidLayoutSubviews() {
        
    }
    
    // MARK: - Private
    
    private func setup() {
        // Do the setup here.
        setupStackView()
        setupLabel()
        view.backgroundColor = UIColor(resource: .customGradiant)
    }
    
    private func setupLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -81)
        ])
    }
    
    private func setupStackView() {
        view.addSubview(stackView)

        stackView.addArrangedSubview(productIdLabel)
        stackView.addArrangedSubview(productIdTextField)
        stackView.addArrangedSubview(validateButton)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 24
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = 24
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor)
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
    
    private func createProductIdTextField() -> UIView {
        let textView = CutomeTextField()
        textView.textField.placeholder = "identifiant produit"
        textView.textField.clearButtonMode = .whileEditing
        return textView
    }
    
    private func createValidateButton() -> UIButton {
        let button = ComfirmedButtonView()
        button.setTitle("Confirmer", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
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
        return stackView
    }
    
    @objc func action(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
    }
    
    private func comfirmedButton() -> UIView {
        let view = UIView()
        view.addSubview(validateButton)
        
        return view
    }
}
