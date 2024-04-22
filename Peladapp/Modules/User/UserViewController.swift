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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        view = baseView
    }
}
