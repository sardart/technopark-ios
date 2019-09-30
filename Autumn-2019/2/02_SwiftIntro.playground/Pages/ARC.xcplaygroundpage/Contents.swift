//: [Previous](@previous)
//ARC
//class Person {
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
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//reference1 = Person(name: "John Appleseed")
//reference2 = reference1
//reference3 = reference1

//удалим все сильные ссылки на класс
//reference1 = nil
//reference2 = nil
//reference3 = nil




//Сильные циклы
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) освобождается") }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    var tenant: Person?
//    deinit { print("Апартаменты \(unit) освобождаются") }
//}
//
//var john: Person?
//var unit4A: Apartment?
//
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//john!.apartment = unit4A
//unit4A!.tenant = john
//john = nil
//unit4A = nil



//нужно сделать weak
//также есть вариант сделать unowned ссылку, в отличие от weak она всегда имеет значение

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
//var john: Customer?
//john = Customer(name: "John Appleseed")
//john!.card = CreditCard(number: 1234567890123456, customer: john!)
//john = nil



//список захвата в замыканиях
//class HTMLElement {
//
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = { [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//
//    deinit {
//        print("\(name) освобождается")
//    }
//}
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())
//paragraph = nil
//: [Next](@next)
