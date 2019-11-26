
import Foundation

//var thread1 = pthread_t(bitPattern: 0)
//var attr1 = pthread_attr_t()
//
//pthread_attr_init(&attr1)
//pthread_create(&thread1, &attr1, { pointer in
//   sleep(1)
//   print("test1")
//
//   return nil
//}, nil)
//
//var thread2 = pthread_t(bitPattern: 0)
//var attr2 = pthread_attr_t()
//
//pthread_attr_init(&attr2)
//pthread_create(&thread2, &attr2, { pointer in
//
//    print("test2")
//
//    return nil
//}, nil)

////возможны оба варианта test1 test2

//-------------------------------
//let thread1 = Thread {
//
//   print("test1")
//   let thread2 = Thread {
//        print("test2")
//   }
//   thread2.start()
//}
//
//thread1.start()
//
////test1 test2

//-------------------------------
let thread1 = Thread {
    print("test1")
}
thread1.qualityOfService = .background
thread1.start()

let thread2 = Thread {
    print("test2")
}
thread2.qualityOfService = .userInitiated
thread2.start()
// возможны оба варианта test1 test2
