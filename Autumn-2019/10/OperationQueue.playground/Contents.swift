import UIKit

//let operationQueue = OperationQueue()
//operationQueue.addOperation {
//    print("test1")
//}
//operationQueue.addOperation {
//    print("test2")
//}
////возможны оба варианта

//------
//let operationQueue1 = OperationQueue()
//let operationQueue2 = OperationQueue()
//
//var int = 1
//let operation = BlockOperation {
//    print(int);
//    int += 1
//}
//
//operationQueue1.addOperation(operation)
//sleep(1)
//operationQueue2.addOperation(operation)//крэш
//операция может выполнится только 1 раз

//------------------
//let operationQueue = OperationQueue()
//operationQueue.maxConcurrentOperationCount = 1
//operationQueue.addOperation {
//     print("test1")
//     sleep(1)
//}
//operationQueue.addOperation {
//     print("test2")
//}

//------------------
//class TestOperation: Operation {
//
//   override func main() {
//      sleep(2)
//    if isCancelled {
//        return
//    }
//      print("test")
//   }
//}
//let operationQueue = OperationQueue()
//let testOperation = TestOperation()
//operationQueue.addOperation(testOperation)
//sleep(1)
//testOperation.cancel()

//------------------
//let operationQueue = OperationQueue()
//let operation1 = BlockOperation {
//    print("test1")
//}
//let operation2 = BlockOperation {
//    print("test2")
//}
//let operation3 = BlockOperation {
//    print("test3")
//}
//
//operation3.addDependency(operation2)
//
//operationQueue.addOperations([operation1, operation2, operation3], waitUntilFinished: false)
//////test1 test2 test3
//////test2 test1 test3
//////test2 test3 test1

//------------------
let operationQueue = OperationQueue()
operationQueue.addOperation {
     print("test1")
}
operationQueue.addOperation {
     sleep(3)
     print("test2")
}
operationQueue.waitUntilAllOperationsAreFinished()
operationQueue.addOperation {
     print("test3")
}
