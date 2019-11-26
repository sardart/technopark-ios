import UIKit


//let serialQueue = DispatchQueue(label: "serialQueue")
//serialQueue.async {
//  print("test1")
//}
//print("test2")
////// возможны оба варианта
////-------------------------------
//let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
//concurrentQueue.sync {
//  print("test1")
//}
//print("test2")
//test1 test2
//
//let serialQueue = DispatchQueue(label: "serialQueue")
//serialQueue.sync {
//   print("test1")
//}
//serialQueue.async {
//   sleep(3)
//   print("test2")
//}
//serialQueue.sync {
//   print("test3")
//}
////test1 test2 test3

//----------------------------------------------
//let item = DispatchWorkItem {
//   print("test")
//}
//let serialQueue = DispatchQueue(label: "serialQueue")
////serialQueue.async {
////    sleep(1)
////}
//serialQueue.async(execute: item)
//item.cancel()

//----------------------------------------------
//let serialQueue = DispatchQueue(label: "serialQueue")
//let item = DispatchWorkItem {
//     print("test")
//}
//item.notify(queue: serialQueue) {
//     print("finish")
//}
//serialQueue.async {
//     sleep(1)
//}
//serialQueue.async(execute: item)
//item.cancel()
