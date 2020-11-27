//
//  AsyncAfterItem.swift
//  Multithreading
//
//  Created by p.nosov on 27.11.2020.
//

import UIKit

class AsyncAfterItem: Item {
    override func run() {
        super.run()

        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        concurrentQueue.asyncAfter(deadline: .now() + 1) {
            print("test1")
        }
        print("other code")

    }
}
