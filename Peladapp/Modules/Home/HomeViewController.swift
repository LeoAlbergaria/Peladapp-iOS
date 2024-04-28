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
    var viewModel: HomeViewModelProtocol?
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Dentro", image: UIImage(systemName: "checkmark"), handler: { (_) in
                self.viewModel?.addPlayer()
            }),
            UIAction(title: "Fora", image: UIImage(systemName: "multiply"), attributes: .destructive, handler: { (_) in
                self.viewModel?.removePlayer()
            }),
            UIAction(title: "Adicionar visitante", image: UIImage(systemName: "person.2"), handler: { (_) in
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
        setupData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "plus"), target: self, action: nil, menu: demoMenu)
    }
    
    private func setupData() {
        
        viewModel?.getPelada(withId: "KQkGb6AxqxqZKDQWo51S") { [weak self] error in
            if let error = error {
                print(error)
            } else {
                guard let pelada = self?.viewModel?.pelada else { return }
                self?.baseView.configure(title: pelada.name, date: Date())
                
                self?.viewModel?.observeFirstMatchForPelada(withId: "KQkGb6AxqxqZKDQWo51S") { [weak self] error in
                    self?.baseView.tableView.reloadData()
                }
            }
        }
    } 
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let row = indexPath.row
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        switch section {
        case 0:
            return viewModel.inList.count
        case 1:
            return viewModel.waitingList.count
        case 2:
            return viewModel.outList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel,
              let cell = baseView.tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        
        let section = indexPath.section
        let row = indexPath.row
        var name = ""
        
        switch section {
        case 0:
            name = viewModel.inList[row]
        case 1:
            name = viewModel.waitingList[row]
        case 2:
            name = viewModel.outList[row]
        default:
            name = ""
        }
        
        cell.selectionStyle = .none
        cell.configure(inSection: section, name: name)
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
