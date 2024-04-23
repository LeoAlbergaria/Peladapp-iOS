//
//  HomeViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 19/04/24.
//

import Foundation
import FirebaseFirestore

protocol HomeViewModelProtocol {
    func loadData(completion: @escaping (Bool) -> Void)
    func addPlayer()
    func removePlayer()
    
    var inList: [String] { get }
    var waitingList: [String] { get }
    var outList: [String] { get }
}

class HomeViewModel: HomeViewModelProtocol {
    let database = Firestore.firestore()
    
    let name: String = ""
    var inList: [String] = []
    let waitingList: [String] = []
    var outList: [String] = []
    
    func loadData(completion: @escaping (Bool) -> Void) {
        
        let colRef = database.collection("Peladas/KQkGb6AxqxqZKDQWo51S/matches")
        
        let query = colRef.limit(to: 1)
        
        query.getDocuments { snapshot , error in
            guard let doc = snapshot?.documents.first else {
                completion(false)
                return
            }
    
            let docRef = doc.reference
            
            doc.reference.addSnapshotListener { documentSnapshot , error in
                guard let data = documentSnapshot?.data() else {
                    completion(false)
                    return
                }
                
                guard let inList = data["inList"] as? [String],
                      let outList = data["outList"] as? [String] else {
                    completion(false)
                    return
                }
                
                self.inList = inList
                self.outList = outList
                completion(true)
            }
        }
    }
    
    func addPlayer(){
        let colRef = database.collection("Peladas/KQkGb6AxqxqZKDQWo51S/matches")
        
        let query = colRef.limit(to: 1)
        
        query.getDocuments { snapshot , error in
            guard let doc = snapshot?.documents.first else {
                return
            }
            
            guard var inList = doc["inList"] as? [String],
                  var outList = doc["outList"] as? [String],
                  let user = UserDefaults.getUID() else { return }
            
            if !inList.contains(user) {
                outList.removeAll(where: { $0 == user} )
                inList.append(user)
                doc.reference.updateData(["inList": inList,
                                          "outList": outList])
            }
        }
    }
    
    func removePlayer(){
        let colRef = database.collection("Peladas/KQkGb6AxqxqZKDQWo51S/matches")
        
        let query = colRef.limit(to: 1)
        
        query.getDocuments { snapshot , error in
            guard let doc = snapshot?.documents.first else {
                return
            }
            
            guard var inList = doc["inList"] as? [String],
                  var outList = doc["outList"] as? [String],
                  let user = UserDefaults.getUID() else { return }
            
            if !outList.contains(user) {
                inList.removeAll(where: { $0 == user} )
                outList.append(user)
                doc.reference.updateData(["inList": inList,
                                          "outList": outList])
            }
        }
    }
}
