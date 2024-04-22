//
//  UserDefaults+extensions.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 22/04/24.
//
import Foundation

// Keys
private let keyUID = "keyUID"

extension UserDefaults {
    
    public func set<T: Codable>(object: T, forKey: String) throws {
        
        let jsonData = try JSONEncoder().encode(object)
        
        set(jsonData, forKey: forKey)
    }
    
    public func get<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {
        
        guard let result = value(forKey: forKey) as? Data else {
            return nil
        }
        
        return try JSONDecoder().decode(objectType, from: result)
    }
    
    // MARK: - UID
    static func setUID(_ id: String) {
        do {
            try UserDefaults.standard.set(object: id, forKey: keyUID)
            UserDefaults.standard.synchronize()
        } catch let error {
            print(error)
        }
    }
    
    static func getUID() -> String? {
        do {
            return try UserDefaults.standard.get(objectType: String.self, forKey: keyUID)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    static func logout() {
        UserDefaults.standard.removeObject(forKey: keyUID)
    }
}
