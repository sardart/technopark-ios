//
//  CancelOperationItem.swift
//  Multithreading
//
//  Created by p.nosov on 30.11.2020.
//

import UIKit

class CancelOperationItem: Item {
    let queue = OperationQueue()

    override func prepare() {
//        queue.maxConcurrentOperationCount = 4
        queue.isSuspended = false
    }

    override func run() {
        super.run()
//        let operation = CancelOperation()
//        queue.addOperation(operation)
//        operation.cancel()
        testSuspend()
    }

    func testSuspend() {
        queue.isSuspended = true
        let operation = CancelOperation()
        queue.addOperation(operation)
        queue.isSuspended = false
        queue.waitUntilAllOperationsAreFinished()
        print("Work is done")
    }
}


private class CancelOperation: Operation {

    override func main() {
        super.main()
        print(#function)
        sleep(1)
        if isCancelled {
            print("cancelled")
        } else {
            print("done")
        }
    }
}
