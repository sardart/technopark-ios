//
//  Person+CoreData.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import Foundation

extension Person {
    
    init(corePerson: CorePerson) {
        self.id = Int(corePerson.id)
        self.firstName = corePerson.firstName ?? ""
        self.lastName = corePerson.lastName ?? ""
    }
}
