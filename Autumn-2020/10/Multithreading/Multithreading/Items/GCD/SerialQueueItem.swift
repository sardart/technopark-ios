//
//  SerialQueueItem.swift
//  Multithreading
//
//  Created by p.nosov on 27.11.2020.
//

import UIKit

class SerialQueueItem: Item {
    override func run() {
        super.run()
        let serialQueue = DispatchQueue(label: "serialQueue")
        serialQueue.async {
            print("test1")
        }
        
        serialQueue.async {
            sleep(1)
            print("test2")
        }
        
        print("test5")
        
        serialQueue.sync {
            print("test3")
        }
        
        serialQueue.sync {
            print("test4")
        }
        
        print("test6")
        
    }
}
