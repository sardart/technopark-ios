//
//  TestsTests.swift
//  TestsTests
//
//  Created by Gennady Evstratov on 11/29/17.
//  Copyright © 2017 Gennady Evstratov. All rights reserved.
//

import XCTest

class MultiplierTests: XCTestCase {
    
    var multiplier: MultiplierService?
    
    override func setUp() {
        super.setUp()
        
        self.multiplier = MultiplierServiceImpl()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        guard let multiplier = self.multiplier else {
            XCTAssert(false, "no service")
            return
        }
        
        let val = 2
        let val1 = 3
        XCTAssert(multiplier.mul(val) == 6, "неправильный результат")
        XCTAssert(multiplier.mul(val1) == 9, "неправильный результат")
    }
}
