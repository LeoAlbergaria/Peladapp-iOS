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
        baseView.delegate = self
    }
}

extension JoinPeladaViewController: JoinPeladaViewDelegate {
    func joinAction() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate else {
            return
        }
        
        sceneDelegate.window?.rootViewController = TabController()
    }
}
