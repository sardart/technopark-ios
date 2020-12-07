//
//  ListViewController.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 06.12.2020.
//

import UIKit

protocol ListRowDescription {
    var controllerIdentifier: String { get }
}

class ListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    enum Rows: String, CaseIterable {
        case userDefaults = "User Defaults"
        case fileManager = "File Manager"
        case coreData = "Core Data"
        case realm = "Realm"
    }
    
    subscript(rowAt index: Int) -> Rows? {
        let allRows = Rows.allCases
        guard index < allRows.count else {
            return nil
        }
        
        return allRows[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    private func loadController(with identifier: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
    private func showController(with identifier: String) {
        guard let controller = loadController(with: identifier) else {
            debugPrint("failed to load controller with id: \(identifier)")
            return
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultIdentifier") else {
            return UITableViewCell()
        }
        
        guard let row = self[rowAt: indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = row.rawValue
        
        return cell
    }
    
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let row = self[rowAt: indexPath.row] else {
            return
        }
        
        showController(with: row.controllerIdentifier)
    }
    
}

extension ListViewController.Rows: ListRowDescription {
        
    var controllerIdentifier: String {
        let result: String
        switch self {
        case .userDefaults:
            result = "UserDefaultsViewController"
        case .fileManager:
            result = "FileManagerViewController"
        case .coreData:
            result = "FetchMenuViewController"
        case .realm:
            result = "RealmExampleMenuViewController"
        }
        
        return result
    }
    
}
