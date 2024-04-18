//
//  WelcomeViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 15/04/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: WelcomeView = WelcomeView()
    
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

//MARK: -WelcomeView Delegate

extension WelcomeViewController: WelcomeViewDelegate {
    func registerButtonClick() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    func loginButtonClick() {
        let viewController = LoginViewController()
        viewController.viewModel = LoginViewModel()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
