//
//  OperationResult.swift
//  Multithreading
//
//  Created by p.nosov on 30.11.2020.
//

import UIKit

class OperationResult: Item {
    override func run() {
        super.run()
        let operation = ResultOperation()
        operation.input = 5
        operation.start()

        print(operation.output ?? 0)
    }
}

class ResultOperation: Operation {
    var input: Int = 0
    var output: Int?

    override func main() {
        output = input + 1
    }
}
