//: [Previous](@previous)

import Foundation



//Кортежи

let http404Error = (404, "Not Found")
// http404Error имеет тип (Int, String), и равен (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Выведет "The status code is 404"
print("The status message is \(statusMessage)")
// Выведет "The status message is Not Found"


//Коллекции


var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
// массив someInts теперь содержит одно значение типа Int
someInts = []
// массив someInts теперь пуст, но все равно имеет тип [Int]

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles имеет тип [Double] и равен [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles имеет тип [Double] и равен [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// тип sixDoubles выведен как [Double] и равен [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


var shoppingList = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items.")
// Выведет "The shopping list contains 2 items."
if shoppingList.isEmpty {
print("The shopping list is empty.")
} else {
print("The shopping list is not empty.")
}
shoppingList.append("Flour")
//​// shoppingList теперь содержит 3 элемента, а кое-кто делает блины
shoppingList += ["Baking Powder"]
//​// shoppingList теперь хранит 4 элемента
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//​// shoppingList теперь хранит 7 элементов
shoppingList[4...6] = ["Bananas", "Apples"]
//​// shoppingList теперь содежит 6 элементов
print(shoppingList)

let mapleSyrup = shoppingList.remove(at: 0)
//​// элемент который имел индекс 0 был удален
//// shoppingList теперь содержит 6 элементов


var letters = Set<Character>()
print("letters имеет тип Set<Character> с \(letters.count) элементами.")
letters.insert("a")
// letters теперь содержит 1 элемент типа Character
letters = []
// letters теперь является пустым множеством, но все еще имеет тип Set<Character>
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres был инициализирован при помощи трех начальных элементов
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]
print("У меня есть \(favoriteGenres.count) любимых музыкальных жанра.")
// Выведет "У меня есть 3 любимых музыкальных жанра."
if favoriteGenres.isEmpty {
    print("Мне все равно какая музыка играет. Я не придирчив.")
} else {
    print("У меня есть свои музыкальные предпочтения.")
}
// Выведет "У меня есть свои музыкальные предпочтения."
favoriteGenres.insert("Jazz")
// теперь в favoriteGenres находится 4 элемента
for genre in favoriteGenres {
    print("\(genre)")
}



var namesOfIntegers = [Int: String]()
// namesOfIntegers является пустым [Int: String] словарем
namesOfIntegers[16] = "sixteen"
// namesOfIntegers теперь содержит 1 пару ключ-значение
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.")
// Выведет "The airports dictionary contains 2 items."
if airports.isEmpty {
  print("The airports dictionary is empty.")
} else {
  print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
// словарь airports теперь содержит 3 элемента
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  print("The old value for DUB was \(oldValue).")
}
// Выведет "The old value for DUB was Dublin."
if let airportName = airports["DUB"] {
  print("The name of the airport is \(airportName).")
} else {
  print("That airport is not in the airports dictionary.")
}
// Выведет "The name of the airport is Dublin Airport."
airports["APL"] = "Apple International"
// "Apple International" несуществующий аэропорт для APL, так что удалим его
airports["APL"] = nil
// APL теперь был удален из словаря"
for (airportCode, airportName) in airports {
  print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
  print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

for airportName in airports.values {
  print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson


//Функции
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var a = 5
var b = 4
swapTwoInts(&a,&b)
print(a,b)


func addTwoInts(a: Int, _ b: Int) -> Int {
  return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
  return a * b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
// Выведет "Result: 5"
func printMathResult(_ mathFunction: (Int, Int) -> Int, firstNumber a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, firstNumber: 3, 5)
// Выведет "Result: 8"


//Замыкания

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
   return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames равен ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
   return s1 > s2
})

//определение типа контекста
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
//неявно возвращаемые значения
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
//сокращенные имена параметров
reversedNames = names.sorted(by: { $0 > $1 })
//операторная функция
reversedNames = names.sorted(by: >)

reversedNames = names.sorted { $0 > $1 }


//: [Next](@next)
