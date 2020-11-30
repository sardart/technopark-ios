//
//  QueueSuspendItem.swift
//  Multithreading
//
//  Created by p.nosov on 30.11.2020.
//

import UIKit

class QueueSuspendItem: Item {
    let queue = DispatchQueue(label: "Test queue",
                              qos: .utility,
                              attributes: [.concurrent, .initiallyInactive])

    override func run() {
        super.run()

        queue.async {
            print("Done")
        }
        print("Not yet started")
        queue.activate()
        print("Activated")
        queue.suspend()
        print("Pause")
        queue.async {
            print("WoW")
        }
        queue.resume()
    }
}
