//
//  Person.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 07.12.2020.
//

import RealmSwift

class Person: Object {
    
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    
}

extension Person {
    
    var fullName: String {
        firstName + " " + lastName
    }
    
}
