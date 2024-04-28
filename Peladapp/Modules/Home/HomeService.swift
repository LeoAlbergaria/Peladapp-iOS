//
//  HomeService.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 25/04/24.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeService {
    private let database = Firestore.firestore()
    
    func getPelada(withId peladaId: String, completion: @escaping (Pelada?, Error?) -> Void) {
        database.collection("Peladas").document(peladaId).getDocument { document, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let document = document, document.exists else {
                completion(nil, nil)
                return
            }
            
            let result = Result {
                try document.data(as: Pelada.self)
            }
            switch result {
            case .success(let pelada):
                completion(pelada, nil)
            case .failure(let error):
                print("Error decoding pelada: \(error)")
                completion(nil, error)
            }
        }
    }
    
    func observeFirstMatchForPelada(withId peladaId: String, completion: @escaping (Match?, Error?) -> Void) {
        let query = database.collection("Peladas").document(peladaId).collection("matches")
            .order(by: "matchId")
            .limit(to: 1)
        
        let matchListener = query.addSnapshotListener { snapshot, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let documents = snapshot?.documents, let document = documents.first else {
                completion(nil, nil)
                return
            }
            
            let result = Result {
                try document.data(as: Match.self)
            }
            switch result {
            case .success(let match):
                completion(match, nil)
            case .failure(let error):
                print("Error decoding match: \(error)")
                completion(nil, error)
            }
        }
    }
}
