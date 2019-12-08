//
//  DataDisplayViewController.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import UIKit

class DataDisplayViewController: UIViewController, DataDisplayModuleInput, DataSourceDelegate {

    fileprivate var dataManager: DataManagerProtocol?
    fileprivate var dataSource: DataSourceProtocol?
    
    @IBOutlet fileprivate weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource?.setup(with: tableView, delegate: self)
    }

    // MARK: - DataDisplayModuleInput
    func setup(with dataSource: DataSourceProtocol?, dataManager: DataManagerProtocol?) {
        self.dataSource = dataSource
        self.dataManager = dataManager
    }

    @IBAction func addElementsButtonPressed(_ sender: Any) {
        (0..<10).forEach { _ in self.dataManager?.saveOrUpdate(person: Person.random) }
    }
}

