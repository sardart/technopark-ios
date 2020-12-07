//
//  ManualFetchViewController.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 06.12.2020.
//

import UIKit
import CoreData

class ManualFetchViewController: UIViewController {
    
    private let dataManager: DataManager = DataManager.shared
    
    private var dataSource: [TestItem] = []
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.initializeCoreDataIfNeeded(success: nil) { error in
            self.showErrorSetupDataBase(error)
        }
        
        tableView.tableFooterView = UIView()
    }
    
    private func showErrorSetupDataBase(_ error: Error) {
        let alert = UIAlertController(title: "Error initialising CoreData stack",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        
        alert.addAction(.init(title: "ok".uppercased(),
                              style: .cancel,
                              handler: nil))
        
        present(alert, animated: true, completion: {
            abort()
        })
    }
    
    private func fetchItems() {
        dataSource = dataManager.fetch(with: fetchRequest()) ?? []
        tableView.reloadData()
    }
    
    private func addItem(with value: Int) {
        dataManager.createObject { item in
            guard let item_ = item as? TestItem else {
                return
            }
            
            item_.value = "\(value)"
        }
    }
    
    private func fetchRequest() -> NSFetchRequest<TestItem> {
        TestItem.fetchRequest()
    }

}

extension ManualFetchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultIdentifier") else {
            return UITableViewCell()
        }
        
        let item = dataSource[indexPath.row]
        cell.textLabel?.text = "Item value: \(item.value)"
        
        return cell
    }
    
}

extension ManualFetchViewController {
    
    @IBAction private func addTapped() {
        addItem(with: dataManager.count(for: fetchRequest()))
    }
    
    @IBAction private func fetchTapped() {
        fetchItems()
    }
    
}
