//: [Previous](@previous)
/*:
 
 # Структуры
 
 Кроме классов в swift есть структуры. Они почти как классы, но не совсем классы. Посмотрим, как они объявляются.

*/


import Foundation

struct Ex {
    let a: Int
    let b: Int
}

let ex = Ex(a: 1, b: 2)
print("a: \(ex.a), b: \(ex.b)")
// a: 1, b: 2

struct A {
    var a: Int = 0
}

//let a = A()
var a = A()

print("\(a.a)")
// 0

a.a = 10
print("\(a.a)")
// 10


class A1 {
    var a: Int = 0
}

let a1 = A1()
print(a1.a)

a1.a = 10
print(a1.a)

//func testFunc(a: inout A) {
//    print(a.a)
//    a.a = 20
//}
//
//testFunc(a: &a)
//print(a.a)
//func testFunc(a: A1) {
//    print(a.a)
//    a.a = 20
//}
//
//testFunc(a: a1)
//print(a1.a)
////: кроме поля, меняется и само значение a, то есть *делается новый экземпляр структуры*

/*:
 Чтобы поменять поле структуры внутри её метода, метод нужно отметить специальным модификатором `mutating`
 
 */

struct B {
    var b: Int

    mutating func setB(_ value: Int) {
        b = value
    }
}

//let b = B(b: 10)
var b = B(b: 10)
print("b: \(b.b)")
// b: 10


b.setB(100)
print("b: \(b.b)")
// b: 100

//: # Структуры нельзя наследовать

//struct C: B {
//
//}
//


//: # Но они могут реализовывать протоколы

protocol AProto {
    func a()
}

struct ProtoStruct: AProto {
    func a() {
        
    }
}

/*:
 
 # ВАЖНО
 
 по тому, что вы виели выше, вы уже поняли, что структуры ведут себя немного иначе, чем классы. Давайте ещё раз посмотрим на то, в чём разница.
 
 */

protocol Valued {
    var value: Int { get set }
}

protocol ValueHolder {
    var value: Valued { get }
}

struct ValuedStruct: Valued {
    var value: Int
}

class ValuedClass: Valued {
    var value: Int = 10
}

class Holder: ValueHolder {
    var value: Valued
    
    init(with value: Valued) {
        self.value = value
    }
}

var vs = ValuedStruct(value: 10)
let vsh1 = Holder(with: vs)

print("vs: \(vs.value) vsh1: \(vsh1.value.value)")

vs.value = 20

print("vs: \(vs.value) vsh1: \(vsh1.value.value)")

var vc = ValuedClass()
let vch1 = Holder(with: vc)

print("vc: \(vc.value) vch1: \(vch1.value.value)")

vc.value = 20

print("vc: \(vc.value) vch1: \(vch1.value.value)")

//: Классы передаются _по ссылке_, а структуры – _по значению_

//: [Next](@next)
