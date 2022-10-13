//: [Previous](@previous)
//: # Управление потоком
//: ### if, guard, for-in, while, switch, break, continue

//: ## Циклы For-in
//: ### Цикл for-in используется для итерации по коллекциям элементов, таких как диапазоны чисел, элементы массива или символы в строке.

for index in 1...5 {
    print("\(index) умножить на 5 будет \(index * 5)")
}

let minutes = 60
let minuteInterval = 15
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

for character in "Пёс!🐶" {
    print(character)
}


//: ## Циклы While
//: ### Цикл while выполняет набор инструкций до тех пор, пока его условие не станет false.

var i = 0
while i < 5 {
    print(i)
    i += 1
}

var j: Int = 0
repeat {
    print(j)
    j += 1
} while j < 5


//: ## Условная инструкция if

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
     print ("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}


//: ## Условная инструкция switch
//: ### Инструкция switch подразумевает наличие какого-то значения, которое сравнивается с несколькими возможными шаблонами.
// Сравнение символа по алфавиту
let someCharacter: Character = "b"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "b":
    print("The second letter of the alphabet")
case "c", "d":
    print("The third and 4-th letter of the alphabet")
default:
    print("Some other character")
}
//: Соответствие диапазону. Значения в кейсах switch могут быть проверены на их вхождение в диапазон.
// Опредение строкового порядка для числа
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
//: Кортежи. Вы можете использовать кортежи для тестирования нескольких значений в одной и той же инструкции switch.
// Нахождение точки в прмоугольнике
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
//: Привязка значений. Кейс в инструкции switch может связывать значение или значения, с которыми сравнивается, с временными константами или переменными.
// Определение, что точка лежит на оси
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//: Where. В кейсе инструкции switch мы так же можем использовать дополнительное условие с помощью ключевого слова where.
// Определение диагонали
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//: ## Операторы передачи управления
//: ### Операторы передачи управления меняют последовательность исполнения вашего кода, передавая управление от одного фрагмента кода другому. continue, break, fallthrough, return, throw.

//: Оператор Continue. Оператор continue говорит циклу прекратить текущую итерацию и начать новую.

for i in 0...5 {
    if i % 2 == 0 {
        continue
    }
    print(i)
}

//: Оператор Break. Оператор break останавливает выполнение всей инструкции управления потоком.

for i in 0...10 {
    if i > 4 {
        break
    }
    print(i)
}

switch "a" {
case "a":
    print("The first letter of the alphabet")
case "b":
    break
default:
    print("Some other character")
}

//: Оператор Fallthrough. Позволяет проваливаться дальше по кейсам в switch

switch "a" {
case "a":
    print("The first letter of the alphabet")
    fallthrough
case "b":
    print("The second letter of the alphabet")
default:
    print("Some other character")
}

//: [Next](@next)
