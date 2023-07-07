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
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        setupTableView()
    }

    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .orange

        registerCells()

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        addTableViewConstraints()
    }

    private func registerCells() {
        // Programatic
        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: "ingredient")

        // XIB
        let nib = UINib(nibName: "ProductDescriptionTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "title")
    }

    private func addTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            view.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: 0)
        ])
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
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
        let ingredient = Ingredient(
            title: "High fructose corn syrup",
            subtile: "Haagen-Dazs",
            percent: 23,
            imageProduct: UIImage(resource: .coca),
            imageNutriscore: UIImage(resource: .nutriscore)
        )

        switch (indexPath.section, indexPath.row) {
        case (0, _):
            return createProductDescriptionCell(using: tableView, ingredient: ingredient)
        case (1, 0):
            return createFirstIngredientCell(using: tableView, ingredient: ingredient)
        case (1, tableView.numberOfRows(inSection: indexPath.section) - 1):
            return createLastIngredientCell(using: tableView, ingredient: ingredient)
        default:
            return createIngredientCell(using: tableView, ingredient: ingredient)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? UIView() : nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0 || section == 1) ? 32 : 0
    }

    private func createProductDescriptionCell(using tableView: UITableView, ingredient: Ingredient) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! ProductDescriptionTableViewCell
        cell.configure(with: ingredient)
        cell.customShadow()
        cell.clipsToBounds = true
        
        return cell
    }

    private func createFirstIngredientCell(using tableView: UITableView, ingredient: Ingredient) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient") as! IngredientTableViewCell
        cell.configure(with: ingredient)
        cell.customCorner(with: .top)
        cell.clipsToBounds = true
        return cell
    }

    private func createLastIngredientCell(using tableView: UITableView, ingredient: Ingredient) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient") as! IngredientTableViewCell
        cell.configure(with: ingredient)
        cell.customCorner(with: .bottom)
        cell.clipsToBounds = true
        return cell
    }


    private func createIngredientCell(using tableView: UITableView, ingredient: Ingredient) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient") as! IngredientTableViewCell
        cell.configure(with: ingredient)
        return cell
    }
}

#Preview {
    ProductDetailsViewController()
}
