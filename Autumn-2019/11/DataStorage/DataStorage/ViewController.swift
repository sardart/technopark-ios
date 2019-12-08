//
//  ViewController.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import UIKit
import Static

fileprivate struct Segues {
    static let coreDataSegueId = "CoreDataSegueId"
    static let realmSegueId = "RealmSegueId"
}

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView?
    var dataSource: DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.tableFooterView = UIView()
        
        dataSource = DataSource(tableView: tableView, sections: [Section(header: "Хранение данных", rows: [
            Row(text: "Core Data", selection: { [unowned self] in
                self.performSegue(withIdentifier: Segues.coreDataSegueId, sender: nil)
                }, accessory: .disclosureIndicator)
            , Row(text: "Realm", selection: { [unowned self] in
                self.performSegue(withIdentifier: Segues.realmSegueId, sender: nil)
                }, accessory: .disclosureIndicator)
            ])
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier else {
            return
        }
        
        switch segueId {
        case Segues.coreDataSegueId:
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            (segue.destination as? DataDisplayModuleInput)?.setup(with: CoreDataDataSource(context: context), dataManager: CoreDataDataManager(context: context))

        case Segues.realmSegueId:
            (segue.destination as? DataDisplayModuleInput)?.setup(with: RealmDataSource(), dataManager: RealmDataManager())
            
        default:
            break
        }
    }

}

