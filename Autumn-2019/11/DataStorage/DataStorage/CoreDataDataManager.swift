//
//  CoreDataDataManager.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import Foundation
import CoreData

class CoreDataDataManager: DataManagerProtocol {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveOrUpdate(person: Person) {
        let managedPerson: CorePerson
        if person.id == 0 {
            managedPerson = makeEntity()
        } else {
            managedPerson = fetchBy(id: person.id) ?? makeEntity()
        }
        
        managedPerson.id = Int64(person.id)
        managedPerson.firstName = person.firstName
        managedPerson.lastName = person.lastName
        
        try! context.save()
    }
    
    func getPerson(id: Int) -> Person? {
        guard let corePerson = fetchBy(id: id) else {
            return nil
        }
        
        return Person(corePerson: corePerson)
    }
    
    func removePerson(id: Int) {
        
    }
    
    fileprivate func fetchBy(id: Int) -> CorePerson? {
        let request = NSFetchRequest<CorePerson>(entityName: "CorePerson")
        request.predicate = NSPredicate(format: "id == %@", id)
        
        return try? context.fetch(request).first ?? makeEntity()
    }
    
    fileprivate func makeEntity() -> CorePerson {
        let description = NSEntityDescription.entity(forEntityName: "CorePerson", in: context)!
        return NSManagedObject(entity: description, insertInto: context) as! CorePerson
    }
    
}
