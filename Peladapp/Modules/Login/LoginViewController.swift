//
//  LoginViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let baseView: UIView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = baseView
    }
}
