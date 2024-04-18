//
//  RegisterViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 16/04/24.
//

import UIKit

protocol RegisterViewControllerDelegate: AnyObject {
    func returnUser(email: String, password: String)
}

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: RegisterView = RegisterView()
    var viewModel: RegisterViewModelProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = baseView
        baseView.delegate = self
    }
}

// MARK: - RegisterView Delegate

extension RegisterViewController: RegisterViewDelegate {
    func registerAction(email: String, password: String) {
        viewModel?.registerUser(email: email, password: password, completion: { user in
            guard let user = user else { return }
            
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    
}
