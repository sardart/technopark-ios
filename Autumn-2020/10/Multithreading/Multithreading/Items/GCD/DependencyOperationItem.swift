//
//  DependencyOperationItem.swift
//  Multithreading
//
//  Created by p.nosov on 30.11.2020.
//

import UIKit

class DependencyOperationItem: Item {

    private let queue = OperationQueue()

    override func run() {
        super.run()

        let firstOperation = MainOperation()
        let secondOperation = SecondOperation()
        secondOperation.addDependency(firstOperation)
        queue.addOperations([firstOperation, secondOperation], waitUntilFinished: true)
        
    }

}

protocol DataPass {
    var data: Int? { get }
}

class MainOperation: Operation, DataPass {

    var input: Int = 0
    private var result: Int?

    override func main() {
        super.main()
        print(#function)
        result = 10
        print("First operation finished")
    }

    var data: Int? {
        return result
    }
}


class SecondOperation: Operation {
    var data: Int? {
        let dependency = dependencies
            .filter{$0 is DataPass}
            .first as? DataPass
        return dependency?.data
    }

    override func main() {
        super.main()
        print("passed data = \(data ?? -1)")
    }
}
