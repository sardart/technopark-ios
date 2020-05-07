//
//  RealmDataSource.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import UIKit
import RealmSwift

class RealmDataSource: NSObject, DataSourceProtocol, UITableViewDataSource, UITableViewDelegate {
    
    fileprivate let realm = try! Realm()
    
    fileprivate weak var tableView: UITableView?
    fileprivate weak var delegate: DataSourceDelegate?
    
    fileprivate var notificationToken: NotificationToken?
    fileprivate var results: Results<RealmPerson>?
    
    func setup(with tableView: UITableView?, delegate: DataSourceDelegate?) {
        self.tableView = tableView
        self.delegate = delegate
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        
        results = realm.objects(RealmPerson.self).sorted(byKeyPath: "id")
        
        // Observe Results Notifications
        notificationToken?.invalidate()
        notificationToken = results?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else {
                return
            }
            
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                tableView.reloadData()
                break
                
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
                break
                
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
                break
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        if let person = results?[indexPath.row] {
            cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
        }
        
        return cell
    }

    deinit {
        notificationToken?.invalidate()
    }
}
