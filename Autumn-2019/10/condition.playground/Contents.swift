import UIKit
import Foundation

//private let condition = NSCondition()
//private var check: Bool = false
//
//func test1() {
//    condition.lock()
//    while !check {
//        condition.wait()
//    }
//    print("test")
//    condition.unlock()
//}
//
//func test2() {
//    condition.lock()
//
//    check = true
//    condition.signal()
//    condition.unlock()
//}
//
//let thread1 = Thread {
//    test1()
//}
//thread1.start()
//
//let thread2 = Thread {
//    test2()
//}
//thread2.start()
//-------------------------------

private var lock = os_unfair_lock_s()

func test(i: Int) {
   os_unfair_lock_lock(&lock)
   sleep(1)
   print(i)
   os_unfair_lock_unlock(&lock)
}
let thread1 = Thread {
    test(i: 1)
}
thread1.start()

let thread2 = Thread {
    sleep(1)
    test(i: 2)
}
thread2.start()

let thread3 = Thread {
    test(i: 3)
}
thread3.start()
////порядок может быть произвольным
