//
//  DataManagerProtocol.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    
    func saveOrUpdate(person: Person)
    func getPerson(id: Int) -> Person?
    func removePerson(id: Int)
    
}
