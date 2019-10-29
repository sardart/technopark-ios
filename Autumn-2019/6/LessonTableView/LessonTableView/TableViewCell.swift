//
//  TableViewCell.swift
//  LessonTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySwitchControl: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillCell(with model: CellModel) {
        myLabel.text = model.title
    }
    
}
