//
//  ConditionItem.swift
//  Multithreading
//
//  Created by p.nosov on 27.11.2020.
//

import UIKit

class ConditionItem: Item {

    private let condition = NSCondition()
    private var check: Bool = false

    override func run() {
        super.run()

        let thread = Thread {
            self.test1()
        }
        thread.start()

        let thread2 = Thread {
            self.test2()
        }
        thread2.start()

    }

    private func test1() {
        print("test1 starts")
        condition.lock()
        print("test1 check")
        while(!check) {
            print("test1 wait")
            condition.wait()
        }
        print("test1 continue work")
        condition.unlock()
        print("test1 exit")
    }

    private func test2() {

        print("test2 starts")
        self.condition.lock()
        sleep(2)
        self.check = true
        print("test2 did some work")
        self.condition.signal()
        self.condition.unlock()
        print("test2 exit")
    }
}
