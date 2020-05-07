//
//  RealmProfileDataManager.swift
//  Lecture11App
//
//  Created by Artur Sardaryan on 5/7/20.
//  Copyright © 2020 Artur Sardaryan. All rights reserved.
//

import RealmSwift
import UIKit

final class RealmPerson: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    @objc dynamic var avatar: Data? = nil
}

final class RealmProfileDataManager: ProfileDataManager {
    
    // MARK: - Properties
    
    private let realm = try? Realm()
    
    // MARK: - Helpers
    
    private func findPerson() -> RealmPerson? {
        let objects = realm?.objects(RealmPerson.self)
                
        return objects?.first
    }
    
    private func updateOrCreatePerson(with updateBlock: @escaping (RealmPerson) -> Void) {
        if let existingPerson = findPerson() {
            do {
                try realm?.write {
                    updateBlock(existingPerson)
                }
            } catch {
                print(error)
            }
        } else {
            let person = RealmPerson()
            do {
                try realm?.write {
                    updateBlock(person)
                    realm?.add(person)
                }
            } catch {
                print(error)
            }
        }
    }

    // MARK: - ProfileDataManager

    func save(name: String?) {
        updateOrCreatePerson { $0.name = name ?? "" }
    }
    
    func save(avatar: UIImage?) {
        updateOrCreatePerson { $0.avatar = avatar?.jpegData(compressionQuality: 1) }
    }
    
    func loadName() -> String? {
        return findPerson()?.name
    }
    
    func loadAvatar() -> UIImage? {
        guard let data = findPerson()?.avatar else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    func clear() {
        guard let person = findPerson() else {
            return
        }
        
        do {
            try realm?.write {
                realm?.delete(person)
            }
        } catch {
            print(error)
        }
    }
}
