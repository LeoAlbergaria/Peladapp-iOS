//
//  RegisterViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 16/04/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: RegisterView = RegisterView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = baseView
    }
}
