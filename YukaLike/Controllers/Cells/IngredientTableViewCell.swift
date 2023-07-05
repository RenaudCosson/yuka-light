//
//  IngredientTableViewCell.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    var title = UILabel()
    var percent = UILabel()
    let image = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitle()
        setupPercent()
        setupImage()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setupTitle() {
        title.text = "High fructose corn syrup"
        title.textColor = .black
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }

    private func setupPercent() {
        percent.textColor = .gray
        
        percent.translatesAutoresizingMaskIntoConstraints = false
        addSubview(percent)
        NSLayoutConstraint.activate([
            percent.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            percent.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            percent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }

    private func setupImage() {
        image.backgroundColor = UIColor(resource: .customGreen)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            image.widthAnchor.constraint(greaterThanOrEqualToConstant: 30),
            image.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            image.centerYAnchor.constraint(greaterThanOrEqualTo: centerYAnchor)
        ])
    }

    func configure(with ingredient: Ingredient) {
        self.title.text = ingredient.title
        self.percent.text = "\(ingredient.percent)%"
    }
}


struct Ingredient {
    let title: String
    let percent: Int
    let image: UIImage?
}
