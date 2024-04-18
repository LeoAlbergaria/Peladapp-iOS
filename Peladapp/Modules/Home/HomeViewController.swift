//
//  HomeViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: HomeView = HomeView()
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Dentro", image: UIImage(systemName: "sun.max"), handler: { (_) in
            }),
            UIAction(title: "Fora", image: UIImage(systemName: "moon"), attributes: .disabled, handler: { (_) in
            }),
            UIAction(title: "Adicionar visitante", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { (_) in
            })
        ]
    }

    var demoMenu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        view = baseView
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "plus"), target: self, action: nil, menu: demoMenu)
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = baseView.tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        switch section {
        case 0:
            headerView.addSubview(baseView.inTitleLabel)
        case 1:
            headerView.addSubview(baseView.waitTitleLabel)
        case 2:
            headerView.addSubview(baseView.outTitleLabel)
        default:
            return headerView
        }
        
        return headerView
    }
}
