//
//  DataSourceProtocol.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import UIKit

protocol DataSourceProtocol {
    
    func setup(with tableView: UITableView?, delegate: DataSourceDelegate?)
    
}
