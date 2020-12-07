//
//  TestItem+CoreDataProperties.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 06.12.2020.
//
//

import Foundation
import CoreData


extension TestItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestItem> {
        return NSFetchRequest<TestItem>(entityName: "TestItem")
    }

    @NSManaged public var value: String

}

extension TestItem : Identifiable {

}
