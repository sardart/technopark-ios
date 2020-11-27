//
//  RecursiveLock.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

import UIKit

class RecursiveLock: Item {

    private let lock = NSRecursiveLock()

    override func run() {
        super.run()

        lock.lock()
        test1()
        lock.unlock()
    }

    func test1() {
        lock.lock()
        print("running test 1")
        lock.unlock()
    }

}
