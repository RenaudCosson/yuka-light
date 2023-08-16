//
//  ProductDescriptionTableViewCell.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import UIKit
import Kingfisher

class ProductDescriptionTableView: UITableViewCell {

    @IBOutlet private var productUIimageView: UIImageView!
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var productNameUILabel: UILabel!
    @IBOutlet private var scoreUIimageView: UIImageView!
    @IBOutlet private var subtitleProductUILabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    // MARK: - Public

    func configure(_ viewModel: ProductDescriptionTableViewModel) {
        self.productNameUILabel.text = viewModel.productNameUILabel
        self.productUIimageView.kf.setImage(with: viewModel.imageProduct)
//        self.scoreUIimageView.image = viewModel.imageNutriscore
    }

    // MARK: - Private

    private func setup() {}
}
