import UIKit

class SemaphoreTest3 {
    private let semaphore = DispatchSemaphore(value: 2)

    func doWork( ) {
        semaphore.wait( )
        print("test")
        sleep(2) //Do something
        semaphore.signal( )
    }

    func test() {
        DispatchQueue.global ( ).async {
            self.doWork( )
        }
        DispatchQueue.global ( ).async {
            self.doWork( )
        }
        DispatchQueue.global ( ).async {
            self.doWork( )
        }
    }
}

let mySemaphore = SemaphoreTest3()
mySemaphore.test()
