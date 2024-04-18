//
//  LoginViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: LoginView = LoginView()
    var viewModel: LoginViewModelProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = baseView
        baseView.delegate = self
    }
}

// MARK: - LoginView Delegate

extension LoginViewController: LoginViewDelegate {
    func loginAction(email: String, password: String) {
        viewModel?.loginUser(email: email, password: password, completion: { success in
            guard success else { return }
            
            print("DEU BOM")
        })
    }
}
