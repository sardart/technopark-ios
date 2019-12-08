//
//  Person+Realm.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import Foundation

extension Person {
    
    var realm: RealmPerson {
        let person = RealmPerson()
        person.id = id
        person.firstName = firstName
        person.lastName = lastName
        
        return person
    }
    
    init(realm: RealmPerson) {
        self.id = realm.id
        self.firstName = realm.firstName
        self.lastName = realm.lastName
    }
    
}
