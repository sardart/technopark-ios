//
//  pthreadItem.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

import Foundation

class pthreadItem: Item {

    override func run() {
        super.run()

        var thread1 = pthread_t(bitPattern: 0) // идентификатор потока (является адресом для хранения идентификатора создаваемого потока типа pthread_t)
        var attr1 = pthread_attr_t() // указатель атрибутов потока.

        pthread_attr_init(&attr1) // инициализация аттрибутов
        pthread_create(&thread1, &attr1, { pointer in // создание потока
            sleep(1)
            print("test1")

            return nil // On success, pthread_create() returns 0; on error, it returns an error number, and the contents of *thread are undefined.
        }, nil)

        var thread2 = pthread_t(bitPattern: 0)
        var attr2 = pthread_attr_t()

        pthread_attr_init(&attr2)
        pthread_create(&thread2, &attr2, { pointer in

            print("test2")

            return pointer
        }, nil)

    }
}
