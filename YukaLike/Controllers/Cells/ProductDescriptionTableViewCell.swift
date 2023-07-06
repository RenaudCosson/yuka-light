//
//  ProductDescriptionTableViewCell.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import UIKit

class ProductDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var productUIimageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var productNameUILabel: UILabel!
    @IBOutlet weak var scoreUIimageView: UIImageView!
    @IBOutlet weak var subtitleProductUILabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with ingredient: Ingredient) {
        self.productNameUILabel.text = ingredient.title
        self.subtitleProductUILabel.text = ingredient.subtile
        self.productUIimageView.image = ingredient.imageProduct
        self.scoreUIimageView.image = ingredient.imageNutriscore

    }
}
