import UIKit

private enum Constants {
    static let pageTile = "Fiche Produit"
    static let cellName = "ingredient"
    static let nibName = "ProductDescriptionTableViewCell"
    static let cellProductName = "title"
}

class ProductDetailsViewController: UIViewController {

    private lazy var tableView = createTableView()
    private var viewModel: ProductDetailViewModel = .empty
    var presenter: ProductDetailPresenter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }
    
    // MARK: - UIView

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }

    // MARK: - Setup

    private func setup() {
        title = Constants.pageTile
        view.backgroundColor = .orange
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

    // MARK: - Private

    private func registerCells() {
        // Programatic
        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: Constants.cellName)

        // XIB
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.cellProductName)
    }

    private func addTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            view.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: 16)
        ])
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }

}

// MARK: - Extension

extension ProductDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDelegate

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionViewModels.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.sectionViewModels[section] {
        case .description:
            return 1
        case .product(let cells):
            return cells.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.sectionViewModels[indexPath.section] {
        case .description(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellProductName) as! ProductDescriptionTableView
            cell.configure(viewModel)
            cell.customShadow()
            return cell
        case .product(let cells):
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellName) as! IngredientTableViewCell
            cell.configure(cells[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? UIView() : nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0 || section == 1) ? 32 : 0
    }
}

extension ProductDetailsViewController: ProductDetailViewContract {
    
    // MARK: - ProductDetailViewContract
    
    func display(_ viewModel: ProductDetailViewModel) {
        self.viewModel.sectionViewModels = viewModel.sectionViewModels
        tableView.reloadData()
    }
}
