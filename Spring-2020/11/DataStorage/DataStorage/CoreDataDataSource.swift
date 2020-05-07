//
//  CoreDataDataSource.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import UIKit
import CoreData

class CoreDataDataSource: NSObject, DataSourceProtocol, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    fileprivate weak var tableView: UITableView?
    fileprivate weak var delegate: DataSourceDelegate?
    
    fileprivate let context: NSManagedObjectContext
    fileprivate var fetchedController: NSFetchedResultsController<CorePerson>?
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    func setup(with tableView: UITableView?, delegate: DataSourceDelegate?) {
        self.tableView = tableView
        self.delegate = delegate
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")

        let fetchRequest = NSFetchRequest<CorePerson>(entityName: "CorePerson")
        
        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Initialize Fetched Results Controller
        fetchedController = NSFetchedResultsController(
            fetchRequest: fetchRequest
            , managedObjectContext: context
            , sectionNameKeyPath: nil
            , cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedController?.delegate = self
        
        try! fetchedController?.performFetch()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedController?.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedController?.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        if let person = fetchedController?.object(at: indexPath) {
            cell.textLabel?.text = "\(person.firstName ?? "") \(person.lastName ?? "")"
        }
        
        return cell
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView?.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView?.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView?.insertRows(at: [indexPath], with: .fade)
            }

        case .delete:
            if let indexPath = indexPath {
                tableView?.deleteRows(at: [indexPath], with: .fade)
            }
            
        case .update:
            if let indexPath = indexPath {
                tableView?.reloadRows(at: [indexPath], with: .none)
            }

        case .move:
            if let indexPath = indexPath {
                tableView?.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let newIndexPath = newIndexPath {
                tableView?.insertRows(at: [newIndexPath], with: .fade)
            }
        }
    }
}
