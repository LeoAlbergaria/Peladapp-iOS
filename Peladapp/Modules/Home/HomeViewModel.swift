//
//  HomeViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 19/04/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol HomeViewModelProtocol {
    func addPlayer()
    func removePlayer()
    func getPelada(withId peladaId: String, completion: @escaping (Error?) -> Void)
    func observeFirstMatchForPelada(withId peladaId: String, completion: @escaping (Error?) -> Void)
    
    var inList: [String] { get }
    var waitingList: [String] { get }
    var outList: [String] { get }
    var pelada: Pelada? { get }
}

class HomeViewModel: HomeViewModelProtocol {
    private let service = HomeService()
    
    private var match: Match?
    
    var inList: [String] = []
    let waitingList: [String] = []
    var outList: [String] = []
    var pelada: Pelada?
    
    func getPelada(withId peladaId: String, completion: @escaping (Error?) -> Void) {
        service.getPelada(withId: peladaId) { [weak self] pelada, error in
            if let error = error {
                completion(error)
            } else {
                self?.pelada = pelada
                completion(nil)
            }
        }
    }
    
    func observeFirstMatchForPelada(withId peladaId: String, completion: @escaping (Error?) -> Void){
        service.observeFirstMatchForPelada(withId: peladaId) { [weak self] match, error in
            if let error = error {
                completion(error)
            } else {
                if let match = match {
                    self?.match = match
                    self?.inList = match.inPlayersList
                    self?.outList = match.outPlayersList
                }
                completion(nil)
            }
        }
    }
    
    func addPlayer(){
        let colRef = Firestore.firestore().collection("Peladas/KQkGb6AxqxqZKDQWo51S/matches")
        
        let query = colRef.limit(to: 1)
        
        query.getDocuments { snapshot , error in
            guard let doc = snapshot?.documents.first else {
                return
            }
            
            guard var inList = doc["inPlayersList"] as? [String],
                  var outList = doc["outPlayersList"] as? [String],
                  let user = UserDefaults.getUID() else { return }
            
            if !inList.contains(user) {
                outList.removeAll(where: { $0 == user} )
                inList.append(user)
                doc.reference.updateData(["inPlayersList": inList,
                                          "outPlayersList": outList])
            }
        }
    }
    
    func removePlayer(){
        let colRef = Firestore.firestore().collection("Peladas/KQkGb6AxqxqZKDQWo51S/matches")
        
        let query = colRef.limit(to: 1)
        
        query.getDocuments { snapshot , error in
            guard let doc = snapshot?.documents.first else {
                return
            }
            
            guard var inList = doc["inPlayersList"] as? [String],
                  var outList = doc["outPlayersList"] as? [String],
                  let user = UserDefaults.getUID() else { return }
            
            if !outList.contains(user) {
                inList.removeAll(where: { $0 == user} )
                outList.append(user)
                doc.reference.updateData(["inPlayersList": inList,
                                          "outPlayersList": outList])
            }
        }
    }
}
