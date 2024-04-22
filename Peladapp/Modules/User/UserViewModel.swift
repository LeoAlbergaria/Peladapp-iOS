//
//  UserViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 22/04/24.
//

import Foundation
import FirebaseAuth

protocol UserViewModelProtocol {
    func logoutUser(completion: @escaping (Bool) -> Void)
}

class UserViewModel {
    func logoutUser(completion: @escaping (Bool) -> Void){
        let auth = Auth.auth()
        do {
            try auth.signOut()
            UserDefaults.logout()
            completion(true)
        } catch {
            debugPrint(error)
            completion(false)
        }
    }
}

