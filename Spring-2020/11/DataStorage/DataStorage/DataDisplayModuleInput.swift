//
//  DataDisplayModule.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import Foundation

protocol DataDisplayModuleInput {
    func setup(with dataSource: DataSourceProtocol?, dataManager: DataManagerProtocol?)
}
