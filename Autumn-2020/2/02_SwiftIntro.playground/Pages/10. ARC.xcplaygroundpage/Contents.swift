//: [Previous](@previous)
/*:

 # ARC

*/

//class SomeGuy {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) инициализируется")
//    }
//    deinit {
//        print("\(name) деинициализируется")
//    }
//}
//
//var reference1: SomeGuy?
//var reference2: SomeGuy?
//var reference3: SomeGuy?
//reference1 = SomeGuy(name: "John Appleseed")
//reference2 = reference1
//reference3 = reference1

//: ![Memory 1t](Memory1.png)


//удалим все сильные ссылки на класс
//reference1 = nil
//reference2 = nil
//reference3 = nil




//:### Сильные циклы
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) освобождается") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Апартаменты \(unit) освобождаются") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

//: ![Memory 2](Memory2.png)

john!.apartment = unit4A
unit4A!.tenant = john

//: ![Memory 3](Memory3.png)

//john = nil
//unit4A = nil

//:### К сожалению, соединяя таким образом, образуется цикл сильных ссылок между экземплярами. Экземпляр Person имеет сильную ссылку на экземпляр Apartment, экземпляр Apartment имеет сильную ссылку на экземпляр Person. Таким образом, когда вы разрушаете сильные ссылки, принадлежащие переменным john и unit4A, их количество все равно не падает до нуля, и экземпляры не освобождаются:

//: ![Memory 4](Memory4.png)

//нужно сделать  weak var tenant: Person?
//также есть вариант сделать unowned ссылку, в отличие от weak она всегда имеет значение

//: ![Memory 5](Memory5.png)


//john = nil


//: ![Memory 6](Memory6.png)


//unit4A = nil

//: ![Memory 7](Memory7.png)


//:### Unowned(бесхозные)
//class Customer {
//    let name: String
//    var card: CreditCard?
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("\(name) деинициализируется") }
//}
//
//class CreditCard {
//    let number: UInt64
//    unowned let customer: Customer
//    init(number: UInt64, customer: Customer) {
//        self.number = number
//        self.customer = customer
//    }
//    deinit { print("Карта #\(number) деинициализируется") }
//}
//var customer: Customer?
//customer = Customer(name: "John Appleseed")
//customer!.card = CreditCard(number: 1234567890123456, customer: customer!)
//customer = nil



//:### Cписок захвата в замыканиях
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name),\(text) освобождаются")
    }
}
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil
//: [Next](@next)
