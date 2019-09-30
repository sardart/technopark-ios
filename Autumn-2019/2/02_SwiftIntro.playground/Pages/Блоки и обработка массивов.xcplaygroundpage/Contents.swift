//: [Previous](@previous)

import Foundation

var i = 10
var s = 0

// Блок
let c = { (a: Int) -> Void in
    s = a + i
    print("sum: \(a + i)")
}

c(1)
print("s: \(s)")
i = 20

c(1)
print("s: \(s)")


let a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


// filter  - убирает

let evens = a.filter{ $0 % 2 == 0 }

//let evens = a.filter{ $0 % 2 == 0 }
print("\(evens)")

// map - преобразование

let doubled = a.map { $0 * 2 }
print("\(doubled)")

// reduce - изменение аккумулятора на базе значений

let sumStr = a.filter{ $0 % 2 == 0 }.map { $0 * 2 }.reduce("", { (acc: String, curr: Int) -> String in
    return acc + " " + String(curr)
})
print(sumStr)


let sum = a.reduce(0) { $0 + $1 }
print("\(sum)")

// но можно и немного иначе!
let evenDoubles = a.reduce([], { return $1 % 2 == 0 ? $0 + [$1] : $0 })
print("\(evenDoubles)")

//: [Next](@next)
