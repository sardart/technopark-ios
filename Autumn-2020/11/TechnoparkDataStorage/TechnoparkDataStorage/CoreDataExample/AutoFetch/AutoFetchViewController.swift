//
//  AutoFetchViewController.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 07.12.2020.
//

import UIKit
import CoreData

class AutoFetchViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let dataManager = DataManager.shared
    
    private lazy var fetchedResultsController: NSFetchedResultsController<TestItem> = {
        let request: NSFetchRequest<TestItem> = TestItem.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: #keyPath(TestItem.value), ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        let frc = NSFetchedResultsController(fetchRequest: request,
                                             managedObjectContext: dataManager.mainQueueContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        frc.delegate = self
        
        return frc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        dataManager.initializeCoreDataIfNeeded(success: nil) { error in
            fatalError(error.localizedDescription)
        }
        
        try? fetchedResultsController.performFetch()
    }
    
}

private extension AutoFetchViewController {
    
    @IBAction func addTapped() {
        addItem(with: fetchedResultsController.fetchedObjects?.count ?? 0)
    }
    
}

private extension AutoFetchViewController {
    
    func addItem(with val: Int) {
        dataManager.createObject { obj in
            guard let obj_ = obj as? TestItem else {
                return
            }
            
            obj_.value = "\(val)"
        }
    }
    
}

extension AutoFetchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultIdentifier") else {
            return UITableViewCell()
        }
        
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = "TestItem value: \(item.value)"
        
        return cell
    }
    
}

extension AutoFetchViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        let rowAnimation = UITableView.RowAnimation.automatic
        
        switch type {
        case .insert:
            if let newIndexPath_ = newIndexPath {
                tableView.insertRows(at: [newIndexPath_], with: rowAnimation)
            }
        case .delete:
            if let indexPath_ = indexPath {
                tableView.deleteRows(at: [indexPath_], with: rowAnimation)
            }
        case .update:
            if let indexPath_ = indexPath {
                tableView.reloadRows(at: [indexPath_], with: rowAnimation)
            }
        case .move:
            if let oldIndexPath = indexPath, let newIndexPath_ = newIndexPath {
                tableView.moveRow(at: oldIndexPath, to: newIndexPath_)
            }
        @unknown default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}
