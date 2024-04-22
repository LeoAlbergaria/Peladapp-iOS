//
//  UserViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 22/04/24.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: UserView = UserView()
    var viewModel: UserViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        view = baseView
        baseView.delegate = self
    }
}

extension UserViewController: UserViewDelegate {
    func logoutAction() {
        viewModel?.logoutUser(completion: { success in
            guard success else { return }
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = windowScene.delegate as? SceneDelegate else {
                return
            }
            
            let viewController = WelcomeViewController()
            
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.tintColor = .black
            
            sceneDelegate.window?.rootViewController = navigationController
        })
    }
}
