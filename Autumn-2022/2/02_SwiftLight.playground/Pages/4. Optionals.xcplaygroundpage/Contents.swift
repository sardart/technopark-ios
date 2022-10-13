//: [Previous](@previous)
//: # Optionals
//: ### Опциональные типы используются в тех случаях, когда значение может отсутствовать. Опциональный тип подразумевает, что возможны два варианта: или значение есть, и его можно извлечь из опционала, либо его вообще нет.

//: ## Опциональные типы
let someNumber: Int? = 10
print(someNumber)

let someString: String? = "Some string"
print(someString)

let doubleValue: Double = 3.14
let someDouble = Optional(3.14)
print(someDouble)


//: ## nil - отсутствия значения
let someConstant: Int? = nil

var someVariable: Int? = nil
someVariable = 123
someVariable = nil


//: ## Оператор объединения по nil (дефолтное значение)
//: ### Является краткой записью a != nil ? a! : b
var someOptionalString: String? = "Some Optional String"
print(someOptionalString ?? "This is nil")
someOptionalString = nil
print(someOptionalString ?? "This is nil")


//: ## Инструкция if и неявное и явное извлечение опционалов
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//: Можно использовать неявное извлечение опционалов (force unwrapping), чтобы попытаться достать значение, вне зависимоти от того, есть ли там значение.
print(convertedNumber!)
//: Не используйте неявно извлечённый опционал, если существует вероятность, что в будущем переменная может стать nil.
let nilValue: Int? = nil
//print(nilValue!) // не сработает, посмотрите на сообщение о креше и закомментируйте эту строку
//: Можно использовать инструкцию if, сравнивая опционал с nil, чтобы проверить, содержит ли опционал значение.
if convertedNumber != nil {
    print(convertedNumber!)
}
//: Можно использовать явное извлечение опционалов (unwrapping), чтобы выяснить содержит ли опционал значение, и если да, то сделать это значение доступным в качестве временной константы или переменной.
if let number = convertedNumber {
    print(number)
}


//: ## Задачи

//: #1
//let tripleOptionalValue: Int??? = 10
//print(tripleOptionalValue)

//: #2
//let optionalInt1: Int? = nil
//let optionalInt2: Int? = nil
//let optionalInt3: Int? = 10
//
//print(optionalInt1 ?? optionalInt2 ?? optionalInt3 ?? 20)

//: [Next](@next)
