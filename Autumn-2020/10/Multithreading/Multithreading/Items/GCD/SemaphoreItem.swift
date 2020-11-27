//
//  SemaphoreItem.swift
//  Multithreading
//
//  Created by p.nosov on 27.11.2020.
//

import UIKit

class SemaphoreItem: Item {

    private let semaphore = DispatchSemaphore(value: 1)
    private let semaphore2 = DispatchSemaphore(value: 0)

    override func run() {
        super.run()
//        test()
        test2()
    }

    func doWork(i: String) {
        print("Enter in doWork func with i = " + i)
        semaphore.wait()
        print("test" + i)
        sleep(2) //Do something
        semaphore.signal()
        print("Finish doWork func with i = " + i)
    }

    func test() {
        DispatchQueue.global().async {
            self.doWork(i: "1")
        }
        DispatchQueue.global().async {
            self.doWork(i: "2")
        }
        DispatchQueue.global().async {
            self.doWork(i: "3")
        }
    }

    func test2() {
        DispatchQueue.global().async {
            DispatchQueue.global().async {
                print("sleep")
                sleep(3)
                print("wake up")
                self.semaphore2.signal()
            }
            self.semaphore2.wait()
            print("done")
        }
    }
}
