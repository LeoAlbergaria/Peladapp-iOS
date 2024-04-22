//
//  RegisterViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import Foundation
import FirebaseAuth

protocol RegisterViewModelProtocol {
    func registerUser(username: String, email: String, password: String, completion: @escaping ((String, String)?) -> Void)
}

class RegisterViewModel: RegisterViewModelProtocol {
    func registerUser(username: String, email: String, password: String, completion: @escaping ((String, String)?) -> Void){
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: password) { authResult, error in
            guard let error = error else {
                let changeRequest = auth.currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges { error in
                    debugPrint(error)
                    completion(nil)
                }
                
                completion((email, password))
                return
            }
            
            debugPrint(error)
            completion(nil)
        }
    }
}
