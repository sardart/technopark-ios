//
//  DWorkItem.swift
//  Multithreading
//
//  Created by p.nosov on 27.11.2020.
//

import UIKit

class DWorkItem: Item {
    override func run() {
        super.run()
        let serialQueue = DispatchQueue(label: "serialQueue")
        let item = DispatchWorkItem {
            print("test")
        }

        item.notify(queue: serialQueue) { // Выполнится после завершения работы DispatchWorkItem
            print("finish")
        }

//        let item2 = DispatchWorkItem(qos: .userInitiated, flags: .noQoS, block: {
//            print("test 2")
//        })

        serialQueue.async(execute: item)
//        serialQueue.async(execute: item2)
//        item2.cancel()
    }
}
