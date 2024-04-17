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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = baseView
    }
}
