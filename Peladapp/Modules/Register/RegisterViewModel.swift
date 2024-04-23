//
//  RegisterViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol RegisterViewModelProtocol {
    func registerUser(username: String, email: String, password: String, completion: @escaping ((String, String)?) -> Void)
}

class RegisterViewModel: RegisterViewModelProtocol {
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    func registerUser(username: String, email: String, password: String, completion: @escaping ((String, String)?) -> Void){
        auth.createUser(withEmail: email, password: password) { authResult, error in
            guard let error = error else {
                guard let currentUser = self.auth.currentUser else {
                    completion(nil)
                    return
                }
                let changeRequest = currentUser.createProfileChangeRequest()
                changeRequest.displayName = username
                changeRequest.commitChanges { error in
                    debugPrint(error)
                    completion(nil)
                }
                
                self.database.collection("users").document(currentUser.uid).setData(["name": username])
                
                completion((email, password))
                return
            }
            
            debugPrint(error)
            completion(nil)
        }
    }
}
