//
//  CoreDataProfileDataManager.swift
//  Lecture11App
//
//  Created by Artur Sardaryan on 5/7/20.
//  Copyright © 2020 Artur Sardaryan. All rights reserved.
//

import UIKit
import CoreData

final class CoreDataProfileDataManager: ProfileDataManager {
    
    // MARK: - Properties
    
    private let entityName = "Person"

    private var context: NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        return appDelegate?.persistentContainer.viewContext
    }
    
    // MARK: - Helpers
    
    private func findPerson() -> Person? {
        let fetchRequest = NSFetchRequest<Person>(entityName: entityName)

        guard let context = context else {
            return nil
        }
        
        do {
            let result = try context.fetch(fetchRequest)
            return result.first
        } catch {
            print(error)
            return nil
        }
    }
    
    private func createPerson() -> Person? {
        guard let context = context else {
            return nil
        }
        
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as? Person
    }
    
    private func updateOrCreatePerson(with updateBlock: @escaping (Person) -> Void) {
        guard let person = findPerson() ?? createPerson() else {
            return
        }
        
        updateBlock(person)
        
        do {
            try context?.save()
        } catch {
            print(error)
        }
    }

    // MARK: - ProfileDataManager

    func save(name: String?) {
        updateOrCreatePerson { $0.name = name }
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
        guard let context = context, let person = findPerson() else {
            return
        }
        
        context.delete(person)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
