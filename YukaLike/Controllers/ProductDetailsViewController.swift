//
//  ProductDetailsViewController.swift
//  YukaLike
//
//  Created by Renaud Cosson on 05/07/2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    private lazy var tableView = createTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = "Fiche Produit"
        view.backgroundColor = .orange
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?
                                                                    .navigationBar
                                                                    .standardAppearance
        setupTableView()
    }

    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .orange
        tableView.showsVerticalScrollIndicator = false

        // Programatic
        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: "ingredient")

        // XIB
        let nib = UINib(nibName: "ProductDescriptionTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "title")


        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        return tableView
    }

}

extension ProductDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 9
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageProduct = UIImage(resource: .coca)
        let imageNutriscore = UIImage(resource: .nutriscore)
        let ingredient = Ingredient(
            title: "High fructose corn syrup",
            subtile: "Haagen-Dazs",
            percent: 23,
            imageProduct: imageProduct,
            imageNutriscore: imageNutriscore
        )

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! ProductDescriptionTableViewCell
            cell.configure(with: ingredient)

            cell.layer.cornerRadius = 24
            cell.clipsToBounds = true

            return cell
        } else if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient") as! IngredientTableViewCell
            cell.configure(with: ingredient)

            cell.layer.cornerRadius = 24
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            cell.clipsToBounds = true

            return cell
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient") as! IngredientTableViewCell
            cell.configure(with: ingredient)

            cell.layer.cornerRadius = 24
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            cell.clipsToBounds = true

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient") as! IngredientTableViewCell
            cell.configure(with: ingredient)

            return cell
        }
    }




    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? UIView() : nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 32
        } else {
            return 0
        }
    }

}

#Preview {
    ProductDetailsViewController()
}
