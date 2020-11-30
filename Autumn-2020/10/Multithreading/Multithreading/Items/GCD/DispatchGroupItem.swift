//
//  DispatchGroupItem.swift
//  Multithreading
//
//  Created by p.nosov on 27.11.2020.
//

import UIKit

class DispatchGroupItem: Item {
    override func run() {
        super.run()

//        test1()
//        timeoutTest()
        notifyTest()
    }

    func test1() {
        let group = DispatchGroup()
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)

        group.enter()
        concurrentQueue.async {
            sleep(2)
            print("test1")
            group.leave()
        }

        group.enter()
        concurrentQueue.async {
            print("test2")
            group.leave()
        }

        group.wait()
        print("test3")
    }

    func timeoutTest() {
        let group = DispatchGroup()
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)

        group.enter()
        concurrentQueue.async {
            sleep(2)
            print("test1")
            group.leave()
        }

        group.enter()
        concurrentQueue.async {
            print("test2")
            group.leave()
        }

        let result = group.wait(timeout: .now() + 1)
        print("gone away")
    }

    func notifyTest() {
        let group = DispatchGroup()
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)

        group.enter()
        concurrentQueue.async {
            sleep(2)
            print("test1")
            group.leave()
        }

        group.enter()
        concurrentQueue.async {
            print("test2")
            group.leave()
        }

        group.notify(queue: .main) {
            print("all tasks done")
        }
        print("gone away")
    }
}
