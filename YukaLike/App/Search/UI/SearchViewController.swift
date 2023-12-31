//
//  SearchViewController.swift
//  YukaLike
//
//  Created by Pierre Cheylus on 14/11/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var titleLabel = createTitleLabel()
    private lazy var productIdLabel = createProductIdLabel()
    private lazy var productIdTextField = createProductIdTextField()
    private lazy var validateButton = createValidateButton()
    private lazy var stackView = createStackView()

    public var presenter: SearchPresenter? 
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupBackButton()
        presenter?.start()
    }

    // MARK: - Setup
    
    private func setupBackButton() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = .orange
        self.navigationItem.backBarButtonItem = backItem
    }
    
    private func setup() {
        // Do the setup here.
        setupStackView()
        setupLabel()
        view.backgroundColor = .orange
    }
    
    private func setupLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 81)
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

        stackView.layer.shadowColor = UIColor.gray.cgColor
        stackView.layer.shadowOpacity = 0.5
        stackView.layer.shadowOffset = CGSize(width: 0, height: 5)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    // MARK: - Private
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }
    
    private func createProductIdLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .gray
        return label
    }
    
    private func createProductIdTextField() -> CustomeTextField {
        let textView = CustomeTextField()
        textView.delegate = self
        return textView
    }
    
    private func createValidateButton() -> UIButton {
        let button = ComfirmedButtonView()
        button.setTitle("", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = UIColor(named: "CustomGreen")
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
    
    @objc private func action() {
        presenter?.didSelectValidate()
    }

    
    
    private func comfirmedButton() -> UIView {
        let view = UIView()
        view.addSubview(validateButton)
        
        return view
    }
}

extension SearchViewController: SearchViewContract {
    func display(_ viewModel: SearchViewModel) {
        self.productIdLabel.text = viewModel.productIdLabel
        self.titleLabel.text = viewModel.titleLabel
        self.validateButton.setTitle(viewModel.validateButtonTitle, for: .normal)
    }

}

extension SearchViewController: CustomTextFieldDelegate {
    func customTextFieldDidEndEditing(_ view: CustomeTextField, text: String) {
        presenter?.didEndingEditing(text: text)
    }
}
