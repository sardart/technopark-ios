//: [Previous](@previous)
//: # Коллекции
//: ### Swift обеспечивает три основных типа коллекций - это Массивы, Множества и Словари для хранения коллекций значений.

//: ## Массивы
//: ### Массивы хранят много значений одинакового типа в упорядоченном списке. Одно и то же значение в массиве может появиться несколько раз, в разных позициях.

//: Создание пустого массива
let someIntArray1: [Int] = []
var someIntArray2 = [Int]()
//: Создание массива с дефолтным значением
let someStringArray: [String] = ["someString1", "someString2"]

let threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles) // threeDoubles имеет тип [Double] и равен [0.0, 0.0, 0.0]

let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
print(anotherThreeDoubles) // anotherThreeDoubles имеет тип [Double] и равен [2.5, 2.5, 2.5]
//: Создание массива, путем объединения двух массивов
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles) // тип sixDoubles выведен как [Double] и равен [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
//: Получение и изменение элементов массива
print(sixDoubles[0])
print(sixDoubles[0...3])
print(sixDoubles)

sixDoubles[0] = 10
sixDoubles[1...2] = [20, 30]
print(sixDoubles)
//print(sixDoubles[100]) // Fatal error: Index out of range
//: Чтобы узнать количество элементов в массиве, проверьте его read-only свойство count:
let arrayForCount = [1, 2, 3]
print(arrayForCount.count)
//: Проверка на пустоту isEmpty
let arrayForIsEmpty = [1, 2, 3]
if arrayForIsEmpty.isEmpty {
    print("Array is empty.")
} else {
    print("Array is not empty.")
}
//: Добавление элементов в массив
var arrayForAdding = [1, 2, 3]

arrayForAdding.append(4)

arrayForAdding += [5, 6]

arrayForAdding.insert(0, at: 0)
//: Удаление элементов в массиве
var arrayForDeleting = [1, 2, 3]

let elem1 = arrayForDeleting.remove(at: 0)
print(elem1, arrayForDeleting)

let elem2 = arrayForDeleting.removeLast()
print(elem2, arrayForDeleting)

let elem3 = arrayForDeleting.removeFirst()
print(elem3, arrayForDeleting)

//arrayForDeleting.remove(at: 0) // Fatal error: Index out of range
//: Итерация по массиву
let shoppingList = ["Eggs", "Milk"]

for item in shoppingList {
  print(item)
}

for (index, value) in shoppingList.enumerated() {
  print("Item \(index + 1): \(value)")
}

//: ## Множества
//: ### Множество хранит различные значения одного типа в виде коллекции в неупорядоченной форме. Вы можете использовать множества как альтернативы массиву, когда порядок для вас значения не имеет или когда вам нужно быть уверенным в том, что значения внутри коллекции не повторяются.

//: Создание множества
let someStringSet1: Set<String> = []
let someStringSet2 = Set<String>()
let someStringSet3: Set = ["apple", "orange"]
//: Методы и свойства множества
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

print(favoriteGenres.count)

if favoriteGenres.isEmpty {
    print("Мне все равно какая музыка играет. Я не придирчив.")
} else {
    print("У меня есть свои музыкальные предпочтения.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? С меня хватит.")
} else {
    print("Меня это не сильно заботит.")
}

if favoriteGenres.contains("Funk") {
    print("О! Да я встал с правильной ноги!")
} else {
    print("Слишком много Funk'а тут.")
}
//: Итерация по множеству
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
/*:
 Выполнение операций с множествами
 
 union - множество состоящее из всех значений обоих множеств.

 intersection - множество из общих значений двух входных множеств.

 subtracting - множество со значениями не принадлежащих указанному множеству из двух входных.
 
 symmetricDifference - множество из значений, которые не повторяются в двух входных множествах.
*/
//: ![SetsOperations.png](SetsOperations.png)
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
 
oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()



//: ## Словари
//: ### Словарь представляет собой контейнер, который хранит несколько значений одного и того же типа. Каждое значение связано с уникальным ключом, который выступает в качестве идентификатора этого значения внутри словаря.

//: Создание словаря
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen" // // namesOfIntegers теперь содержит 1 пару ключ-значение
namesOfIntegers = [:] // namesOfIntegers теперь опять пустой словарь с типом [Int: String]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
let anotherAirports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//: Доступ к элементам словаря
if let airportName = airports["YYZ"] {
  print("The name of the airport is \(airportName).")
} else {
  print("That airport is not in the airports dictionary.")
}
//: Изменение словаря
airports["LHR"] = nil
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  print("The old value for DUB was \(oldValue).")
}
//: Методы и свойства словаря
print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
  print("The airports dictionary is empty.")
} else {
  print("The airports dictionary is not empty.")
}

if let removedValue = airports.removeValue(forKey: "DUB") {
  print("The removed airport's name is \(removedValue).")
} else {
  print("The airports dictionary does not contain a value for DUB.")
}
//: Итерация по словарю
for (airportCode, airportName) in airports {
  print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
  print("Airport code: \(airportCode)")
}

for airportName in airports.values {
  print("Airport name: \(airportName)")
}


//: ## Задачи

//: #1

let birds: [String] = ["Swift", "Eagle", "Raven"]

for bird in birds[1...] {
    print(bird)
}

for bird in birds[..<2] {
    print(bird)
}

//: [Next](@next)
