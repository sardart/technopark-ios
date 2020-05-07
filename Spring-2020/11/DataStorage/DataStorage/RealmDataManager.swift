//
//  RealmDataManager.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import RealmSwift

class RealmDataManager: DataManagerProtocol {
    
    let realm = try! Realm()
    
    func saveOrUpdate(person: Person) {
        if person.id == 0 {
            let id = (realm.objects(RealmPerson.self).sorted(byKeyPath: "id", ascending: false).first?.id ?? 0) + 1
            let realmPerson = person.realm
            realmPerson.id = id
            try! realm.write {
                realm.add(realmPerson)
            }
        } else {
            try! realm.write {
                realm.add(person.realm, update: .all)
            }
        }
    }
    
    func getPerson(id: Int) -> Person? {
        // object(ofType: RealmPerson.self, forPrimaryKey: id)
        guard let realmPerson = realm.objects(RealmPerson.self).filter("id == %@", id).first else {
            return nil
        }
        
        return Person(realm: realmPerson)
    }
    
    func removePerson(id: Int) {
        
    }
    
}
