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
        setupTableView()
    }
    

    private func setup() {
        view.backgroundColor = .red

    }
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: "ingredient")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        return tableView
    }

}

extension ProductDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient") as! IngredientTableViewCell
        let ingredient = Ingredient(title: "High fructose corn syrup", percent: 23, image: nil)
        cell.configure(with: ingredient)
        return cell
    }
    
    
}

#Preview {
    ProductDetailsViewController()
}
