//
//  TableView.swift
//  LessonTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import Foundation
import UIKit

class TableView: UIViewController {

    let customIdentifier = "TableViewCell"
    @IBOutlet weak var tableView: UITableView!
    var modelArray = [CellModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: customIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier)
        fillModelArray()
    }

    func fillModelArray() {
        for i in 1...5 {
            let model = CellModel()
            model.title = "Cell number \(i)"
            modelArray.append(model)
        }
    }
    
}

extension TableView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension TableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelArray[indexPath.row]
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: customIdentifier, for: indexPath)
        if let customTableViewCell = tableViewCell as? TableViewCell {
            customTableViewCell.fillCell(with: model)
        }
        return tableViewCell
    }


}
