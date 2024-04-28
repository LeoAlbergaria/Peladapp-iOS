//
//  PeladaModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 23/04/24.
//

import FirebaseFirestore

// User struct
struct User: Codable {
    let uid: String
    let name: String
    
    init(uid: String, name: String) {
        self.uid = uid
        self.name = name
    }
}

// Pelada struct
struct Pelada: Codable {
    let peladaId: String
    let name: String
    let admin: String
    let players: [String]
    
    init(peladaId: String, name: String, admin: String, players: [String]) {
        self.peladaId = peladaId
        self.name = name
        self.admin = admin
        self.players = players
    }
}

// Match struct
struct Match: Codable {
    let matchId: String
    let isActive: Bool
    let inPlayersList: [String]
    let outPlayersList: [String]
    
    init(matchId: String, isActive: Bool, inPlayersList: [String], outPlayersList: [String]) {
        self.matchId = matchId
        self.isActive = isActive
        self.inPlayersList = inPlayersList
        self.outPlayersList = outPlayersList
    }
}

// Firestore document data conversion
extension User {
    init?(documentData: [String: Any], uid: String) {
        guard let name = documentData["name"] as? String else {
            return nil
        }
        self.init(uid: uid, name: name)
    }
}

extension Pelada {
    init?(documentData: [String: Any], peladaId: String) {
        guard let name = documentData["name"] as? String,
              let admin = documentData["admin"] as? String,
              let players = documentData["players"] as? [String] else {
            return nil
        }
        self.init(peladaId: peladaId, name: name, admin: admin, players: players)
    }
}

extension Match {
    init?(documentData: [String: Any], matchId: String) {
        guard let isActive = documentData["isActive"] as? Bool,
              let inPlayersList = documentData["inPlayersList"] as? [String],
              let outPlayersList = documentData["outPlayersList"] as? [String] else {
            return nil
        }
        self.init(matchId: matchId, isActive: isActive, inPlayersList: inPlayersList, outPlayersList: outPlayersList)
        
    }
}
