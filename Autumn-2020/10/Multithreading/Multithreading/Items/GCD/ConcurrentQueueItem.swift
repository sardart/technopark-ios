//
//  ConcurrentQueueItem.swift
//  Multithreading
//
//  Created by p.nosov on 27.11.2020.
//

import UIKit

class ConcurrentQueueItem: Item {
    override func run() {
        super.run()

        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        concurrentQueue.sync {
            print("test1")
        }

        concurrentQueue.async {
            sleep(1)
            print("test2")
        }

        concurrentQueue.async {
            print("test3")
        }

        print("test4")

    }
}
