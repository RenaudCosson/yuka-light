//
//  IngredientTableViewCell.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    private lazy var title = UILabel()
    private lazy var percent = UILabel()
    private lazy var image = UIImageView()
    private lazy var containerView = UIView()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Public

    func configure(_ viewModel: IngredientTableViewCellModel) {
        self.title.text = viewModel.title
        self.percent.text = "\(viewModel.percent)%"
        self.image.image = UIImage(data: viewModel.image)
    }

    // MARK: - Private

    private func setup() {
        setupTitle()
        setupPercent()
        setupImage()
        setupContainerView()
    }

    private func setupTitle() {
        containerView.addSubview(title)
        title.text = ""
        title.textColor = .black
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            title.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20)
        ])
    }

    private func setupPercent() {
        containerView.addSubview(percent)
        percent.textColor = .gray
        
        percent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            percent.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            percent.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: percent.bottomAnchor, constant: 20)
        ])
    }

    private func setupImage() {
        containerView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            image.widthAnchor.constraint(greaterThanOrEqualToConstant: 30),
            containerView.rightAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            image.centerYAnchor.constraint(greaterThanOrEqualTo: containerView.centerYAnchor)
        ])
    }

    private func setupContainerView() {
        self.contentView.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo:  self.contentView.leftAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo:  self.contentView.bottomAnchor),
            containerView.rightAnchor.constraint(equalTo:  self.contentView.rightAnchor)
        ])
    }
}
