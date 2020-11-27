//
//  ThreadWithQOS.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

import UIKit

class ThreadWithQOS: Item {
    override func run() {
        super.run()
        let thread1 = Thread {
            print("test1")
            print("test1 qos = \(qos_class_self())")
        }

        thread1.qualityOfService = .background
        thread1.start()

        let thread2 = Thread {
            print("test2")
            print("test2 qos = \(qos_class_self())")
        }
        thread2.qualityOfService = .userInitiated
        thread2.start()
    }
}
