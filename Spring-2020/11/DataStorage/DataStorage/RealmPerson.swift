//
//  RealmPerson.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import RealmSwift

class RealmPerson: Object {
     
    @objc dynamic var id = 0
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    
    @objc override static func primaryKey() -> String? {
        return "id"
    }
}
