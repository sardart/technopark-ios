//: [Previous](@previous)

//: # Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if let num = convertedNumber {
    print(num)
}

//: В переменной может быть или хначение заданного типа, или nil
//: И компилятор это проверяет

import Foundation

class A {
    func printA() {
        print(10)
    }
    
    func a() -> Int {
        return 10
    }
}

var a: A? = nil
// пока там ничего нет, но можно написать вот так

a?.printA()
// ничего

a = A()

a?.printA()
// 10

// ?? для того, чтобы спастись

print(a?.a() ?? 25)
// 10

//a = nil
//print(a?.a() ?? 25)
////25


//: ### Это называется unwrapping
if let aaaa = a {
    print(aaaa.a())
} else {
    print(25)
}


//: ### force unwrapped optonals
class B {
    func printB() {
        print(10)
    }

    func b() -> Int {
        return 10
    }
}

var b: B! = nil

//b.printB() // креш при работе, компилятор не ругается
b?.printB()
// nil

b = B()
b.printB() // теперь значение есть

//: [Next](@next)
