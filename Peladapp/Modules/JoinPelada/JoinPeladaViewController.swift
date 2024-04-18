//
//  JoinPeladaViewController.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import UIKit

class JoinPeladaViewController: UIViewController {
    
    // MARK: - Properties
    
    let baseView: JoinPeladaView = JoinPeladaView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        view = baseView
//        baseView.delegate = self
    }
}
