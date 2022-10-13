//: [Previous](@previous)
//: # Замыкания
//: ### Замыкания - это самодостаточные блоки с определенным функционалом, которые могут быть переданы и использованы в вашем коде. Аналог лямбды в других языках программирования.

//: ## Замыкающие выражения
//: ### Замыкающие выражения, являются способом написания встроенных замыканий через краткий и специализированный синтаксис.

//: Передача функции в сортировку
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: backward)
//: Передача замыкающего выражения в сортировку
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//: Определение типа из контекста
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
print(reversedNames)
//: Неявные возвращаемые значения
//func a() -> String {
//    "ABC"
//}
//let a123 = a()

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print(reversedNames)
//: Сокращенные имена параметров
reversedNames = names.sorted(by: { $0 > $1 })
print(reversedNames)
//: Операторные функции
reversedNames = names.sorted(by: >)
print(reversedNames)
//: Последующее замыкание
reversedNames = names.sorted { $0 > $1 }


//: ## Захват значений
//: ### Замыкания могут захватывать константы и переменные из окружающего контекста, в котором они объявлены. После захвата замыкание может ссылаться или модифицировать значения этих констант и переменных внутри своего тела, даже если область, в которой были объявлены эти константы и переменные уже больше не существует.
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0 // захватывается и за счет этого сохраняется в памяти
    func incrementer() -> Int {
      runningTotal += amount
      return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())


//: ## Сбегающие замыкания
//: ### Когда говорят, что замыкание сбегает из функции, то это значит, что это замыкание было передано в функцию в качестве аргумента и вызывается уже после того, как функция вернула значение.

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunction(completionHandler: () -> Void) {
    completionHandler()
}

someFunction { print("!") }

someFunctionWithEscapingClosure { print("!") }

let completionHandler = completionHandlers[0]
completionHandler()


//func getSomeData(handler: @escaping () -> Void) {
//    getSomeDataFromApi { data in
//        handler(data)
//    }
//}


//: ## Автозамыкания
//: ### Автозамыкания позволяют вам откладывать вычисления, потому как код внутри них не исполняется, пока вы сами его не запустите.

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
 
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

customerProvider()
print(customersInLine.count)


//: ## Примеры использования замыканий

let a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//: filter - фильтрация по условию

let evens = a.filter{ $0 % 2 == 0 }
print(evens)

//: map - преобразование

let doubled = a.map { $0 * 2 }
print(doubled)

//: compactMap - аналогичен map, удаляет nil

import Foundation

let urlStrings = [
    "https://www.marvel.com",
    "https://www.😈.com",
    "https://www.dccomics.com"
]
let urls = urlStrings.map { URL(string: $0) }
print(urls)

//: flatMap - преобразует многомерный массив в одномерный

let numbersArray = [[1, 1, 1], [2, 2, 2], [3, 3, 3]]
let numbersFlatArray = numbersArray.flatMap { $0 }
print(numbersFlatArray)

//: reduce - комбинирование элементов с целью получить общий

let someNames = ["Taylor", "Paul", "Adele"]
let charectersCount = someNames.reduce(10) { $0 + $1.count }
print(charectersCount)

let someArray = [1, 2, 3, 4, 5]
let numbersSum1 = someArray.reduce(0, +)
print(numbersSum1)
let numbersSum2 = someArray.reduce(0) { $0 + $1 }
print(numbersSum2)

//: forEach - итерирование

a.forEach {
    print($0)
}

//: [Next](@next)
