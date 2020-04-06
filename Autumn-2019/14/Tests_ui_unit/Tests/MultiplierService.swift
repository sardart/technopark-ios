//
//  MultiplierService.swift
//  Tests
//
//  Created by Gennady Evstratov on 11/29/17.
//  Copyright © 2017 Gennady Evstratov. All rights reserved.
//

import Foundation

protocol MultiplierService {
    func mul(_ val: Int) -> Int
}

public class MultiplierServiceImpl: MultiplierService {
    
    func mul(_ val: Int) -> Int {
        return val * 3;
    }
}
