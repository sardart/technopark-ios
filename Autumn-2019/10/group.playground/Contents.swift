import UIKit

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

//возможны оба варианта
