//
//  RegisterViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import Foundation
import FirebaseAuth

protocol RegisterViewModelProtocol {
    func registerUser(email: String, password: String, completion: @escaping ((String, String)?) -> Void)
}

class RegisterViewModel: RegisterViewModelProtocol {
    func registerUser(email: String, password: String, completion: @escaping ((String, String)?) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let error = error else {
                completion((email, password))
                return
            }
            
            debugPrint(error)
            completion(nil)
        }
    }
}
