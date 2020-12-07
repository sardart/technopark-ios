//
//  RealmExampleViewController.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 07.12.2020.
//

import UIKit
import RealmSwift

class RealmExampleViewController: UIViewController, TableViewFooterable {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: Results<Person>!
    private var notificationToken: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeTableViewGreatAgain()

        loadInitialData()
        notificationToken = dataSource.observe({ [weak self] changes in
            guard let self = self else { return }
            
            switch changes {
            case let .initial(results):
                self.dataSource = results
            case let .update(_, deletions, insertions, modifications):
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                          with: .automatic)
                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                          with: .automatic)
                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                          with: .automatic)
                self.tableView.endUpdates()
            case let .error(error):
                fatalError(error.localizedDescription)
            }
        })
    }
    
    deinit {
        notificationToken = nil
    }
    
    private func loadInitialData() {
        dataSource = try? Realm().objects(Person.self)
    }
    
    private func save(with text: String) {
        let components = text.components(separatedBy: " ")
        let person = Person()
        person.firstName = components.first ?? ""
        person.lastName = components.last ?? ""
        
        let realm = dataSource.realm
        try? realm?.write {
            realm?.add(person)
        }
    }

}

private extension RealmExampleViewController {
    
    @IBAction func addTapped() {
        let alert = UIAlertController(title: "Enter first and last name", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(.init(title: "OK",
                              style: .cancel,
                              handler: { _ in
                                guard let text = alert.textFields?.first?.text, !text.isEmpty else {
                                    return
                                }
                                
                                self.save(with: text)
                              }))
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension RealmExampleViewController: UITableViewDataSource {
    
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
        
        let object = dataSource[indexPath.row]
        cell.textLabel?.text = object.fullName
        
        return cell
    }
    
}

protocol TableViewFooterable: AnyObject {
    var tableView: UITableView! { get }
}

extension TableViewFooterable where Self: UIViewController {
    
    func makeTableViewGreatAgain() {
        tableView.tableFooterView = UIView()
    }
    
}
