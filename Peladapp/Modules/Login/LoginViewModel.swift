//
//  LoginViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 17/04/24.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelProtocol {
    func loginUser(email: String, password: String, completion: @escaping (Bool) -> Void)
}

class LoginViewModel: LoginViewModelProtocol {
    func loginUser(email: String, password: String, completion: @escaping (Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard let error = error else {
                completion(true)
                return
            }
            
            print(error)
            completion(false)
        }
        
    }
}
