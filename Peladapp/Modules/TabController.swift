//
//  TabController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 19/04/24.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    // MARK: - Tab setup
    private func setupTabs(){
        let homeViewController = HomeViewController()
        homeViewController.viewModel = HomeViewModel()
        let home = createNav(with: "Pelada", and: UIImage(systemName: "sportscourt"), vc: homeViewController)
        
        setViewControllers([home], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
    }
}
