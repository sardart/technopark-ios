//
//  MutexItem.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

import UIKit

class MutexItem: Item {

    private var mutex = pthread_mutex_t()

    override init(name: String) {
        super.init(name: name)
        pthread_mutex_init(&mutex, nil)
    }

    override func prepare() {
        _counter = 0
    }

    private var _counter: Int = 0
    private var counter: Int {
        get {
            pthread_mutex_lock(&mutex)
            let val = _counter
            pthread_mutex_unlock(&mutex)
            return val
        }
        set {
            pthread_mutex_lock(&mutex)
            sleep(2)
            _counter = newValue
            pthread_mutex_unlock(&mutex)
        }
    }

    override func run() {
        super.run()

        let thread1 = Thread {
            print("start modifying resource")
            self.counter += 1
            print("end modifying resource")
        }
        thread1.start()

        let thread2 = Thread {
            print("trying to get resource")
            print(self.counter)
            print("got resource")
        }
        thread2.start()

    }

}
