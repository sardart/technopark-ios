//
//  CorePerson+CoreDataProperties.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import Foundation
import CoreData


extension CorePerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CorePerson> {
        return NSFetchRequest<CorePerson>(entityName: "CorePerson")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var id: Int64

}
