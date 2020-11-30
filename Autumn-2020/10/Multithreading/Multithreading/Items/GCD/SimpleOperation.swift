//
//  SimpleOperation.swift
//  Multithreading
//
//  Created by p.nosov on 30.11.2020.
//

import UIKit

class SimpleOperation: Item {
    override func run() {
        super.run()

        let operation = {
            print("started")
            print(Thread.current)
        }
        let queue = OperationQueue()
        queue.addOperation(operation)
//        blockOperationTest()
    }

    func blockOperationTest() {
        let operation = BlockOperation {
            print("started")
            print(Thread.current)
        }
        operation.start() // выполняется СИНХРОННО на текущем потоке.
    }
}
