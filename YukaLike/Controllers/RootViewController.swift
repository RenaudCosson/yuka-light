//
//  RootViewController.swift
//  YukaLike
//
//  Created by Pierre Cheylus on 14/11/2022.
//

import UIKit

class RootViewController: UIViewController {
    
    private lazy var myView = createMyView()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private

    private func setup() {
        // Do the setup here.
        view.backgroundColor = .red
        setupMyView()
    }
    
    private func createMyView() -> UIView {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func setupMyView() {
        view.addSubview(myView)
        
        NSLayoutConstraint.activate([
            myView.heightAnchor.constraint(equalToConstant: 100),
            myView.widthAnchor.constraint(equalToConstant: 100),
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        ])
    }
}
