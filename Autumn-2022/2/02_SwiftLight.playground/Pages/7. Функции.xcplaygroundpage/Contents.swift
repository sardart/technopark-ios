//: [Previous](@previous)
//: # Функции
//: ### Функции – это самостоятельные фрагменты кода, решающие определенную задачу. Каждой функции присваивается уникальное имя, по которому ее можно идентифицировать и "вызвать" в нужный момент.

//: ## Объявление и вызов функций

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

//: ## Параметры функции и возвращаемые значения

func sayHello(whom person: String, _ sign: String) {
    print("Hello \(person)\(sign)")
}

sayHello(whom: "Artur", "")

//: Кортеж как возвращаемое значение

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//: ## Вариативные параметры
//: ### Вариативным называют параметр, который может иметь сразу несколько значений или не иметь ни одного. С помощью вариативного параметра можно передать в функцию произвольное число входных значений.

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5, 6, 7, 8)
arithmeticMean(3, 8.25, 18.75)


//: ## Сквозные параметры
//: ### Сквозные параметры нужны для передачи параметров в функцию не по значению (по умолчанию), а по ссылке.

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var a = 5
var b = 4
swapTwoInts(&a, &b)
print(a, b)

//: ## Функциональные типы

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = multiplyTwoInts
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

//: Функциональные типы как типы параметров функции

func printMathResult(_ mathFunction: (Int, Int) -> Int, firstNumber a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, firstNumber: 3, 5)


//: ## Задачи

//: #1
//func a() {
//    func b() {
//        print("!")
//    }
//
//    b()
//}
//
//a()

//: #2
func plustOne(someValue: inout Int) {
    someValue += 1
}

func plustTwo(someValue: inout Int) {
    plustOne(someValue: &someValue)
    plustOne(someValue: &someValue)
}

var someValue: Int = 10
plustTwo(someValue: &someValue)
print(someValue)

print("!")

//: #3
//func someFunc(_ numbers: Double..., someNumber: Double) -> Double {
//    return someNumber
//}
//
//someFunc(1, 2, 3, 4)

//: [Next](@next)
