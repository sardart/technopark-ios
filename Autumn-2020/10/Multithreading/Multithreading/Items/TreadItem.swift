//
//  TreadItem.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

import UIKit

class TreadItem: Item {
    override func run() {
        super.run()
        let thread1 = Thread {

            print("test1")
            let thread2 = Thread {
                print("test2")
            }
            thread2.start()
        }

        thread1.start()
    }
}
