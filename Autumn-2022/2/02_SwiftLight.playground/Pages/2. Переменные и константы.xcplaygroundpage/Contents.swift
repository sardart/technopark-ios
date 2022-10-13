//: [Previous](@previous)
//: # Основы
//: ## Константы и переменныe
/*:
 let создаёт константу
 
 var создаёт переменную
*/
let thisIsConstant = "Const"
var thisIsVariable = "Var"
//: Значения переменных можно менять во время выполнения программ, а константы задаются только единожды — в момент присваивания.
thisIsVariable = "Some new value"
//thisIsConstant = "если не закомментировать, то будет ошибка" // не сработает, посмотрите на сообщение об ошибке и закомментируйте эту строку


//: ## Типы данных
//: ### Swift - язык со строгой типизацией. Swift призывает вас иметь четкое представление о типах значений, с которыми может работать ваш код.
//: Тип проставляется при создании переменной. Его можно задать явно или неявно.
let thisIsExplixitlyVar: Float = 42.0
print(type(of: thisIsExplixitlyVar))

let thisIsImplicitlyVar = 42.0
print(type(of: thisIsImplicitlyVar))
//: Переменным можно присваивать значения только того же типа, что и сама переменная. Если часть вашего кода ожидает String, вы не сможете передать ему Int по ошибке.
var thisIsVariableWithStringType: String = "Some string"
thisIsVariableWithStringType = "42"
//thisIsVariableWithStringType = 42 // не сработает, посмотрите на сообщение об ошибке и закомментируйте эту строку
print(thisIsVariable)


//: ## Целые числа
//: ### Integer (целое число) - это число, не содержащее дробной части, например, как 42 и -23. Целые числа могут быть либо знаковыми (положительными, ноль или отрицательными) либо беззнаковыми (положительными или ноль).
let integerVariable1 = Int(100000)
let integerVariable2 = 100000
//: При записи числа для удобства можно разделять на блоки цифр, вот так
let separatedLongInteger = 1_000_000_000
//: Так же числа можно записывать в разных системах счисления
let hexInteger = 0xDEADBEEF
let octoInteger = 0o776655
let binaryInteger = 0b1101001000111

//let smallIntValue: Int8 = 128


//: ## Дробные числа
//: ### Число с плавающей точкой - это число с дробной частью, например как 3.14159, 0.1, и -273.15.
//: Float - 32-битное число. Double - 64-битное число.
let floatValue1: Float = Float(42.0)
let floatValue2: Float = 42.0
let doubleValue1: Double = Double(42.0)
let doubleValue2: Double = 42.0



//: ## Булевы значения
//: ### В Swift есть простой логический тип Bool. Этот тип называют логическим, потому что он может быть только true или false.
let boolValue1 = true
let boolValue2 = false


//: ## Строки и символы
//: ### Строка представляет собой совокупность символов, например "hello, world" или "albatross". Строки в Swift представлены типом String. К значению типа String можно получить доступ различными способами, включая и коллекцию значений типа Character.
//: Строки можно задавать в одну строку
let oneLineString1 = String("Это строка")
let oneLineString2 = "Это строка"
//: Строки можно задавать в несколько строк
let multilineString = """
Это строка
"""
//: Эти формы идентичны, смотрите
oneLineString2 == multilineString
(oneLineString2 as AnyObject) === (multilineString as AnyObject)
//: Многострочные строки можно переносить для удобства, вот так:
let wrappedMultilineString = """
Это \
строка
"""
oneLineString2 == wrappedMultilineString
//: Некоторые символы в строках надо экранировать. `\\` это `\`, `\"` это `"`, `\n` — перевод строки, `\t` — табуляция и т.д.
let stringWithEnter = "Строка с \n переводом строки"
print(stringWithEnter)
//: В строки можно подставлять значения, вот так:
let insideValue = "внутри"
print("Оно окажется \(insideValue)")
//: Строки состоят из символов. По ним можно итерироваться стандартным `for..in` циклом, вот так
for character in "Пёс!🐶" {
    print(character)
}
//: Так же строку можно создавать из массива символов, вот так
let catCharacters: [Character] = ["К", "о", "т", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
//: Следующий пример напечатает цифры на основе номера символов таблицы Unicodes
// Цифры от 0 до 9
for value in 48...57 {
    print(Unicode.Scalar(value)!)
}
//: Следующий пример напечатает символы из таблицы Unicodes
let value = "abc"
for u in value.utf8 {
    print(u)
}
//: Строку можно проверить на то, пустая ли она вот так
print(catString.isEmpty)
//: И узнать, сколько в ней символов вот так
print(catString.count)
//: Важно понимать, что `count` выводит количество unicode символов в строке, то есть если к строке добавить символ-модификатор, то количество символов в ней не изменится
var word = "cafe"
print("количество символов в \(word) = \(word.count)")

word += "\u{301}" // café

print("количество символов в \(word) = \(word.count)")


//: ## Кортежи
//: ### Кортежи группируют несколько значений в одно составное значение. Значения внутри кортежа могут быть любого типа. Чаще всего используются для того, чтобы возвращать несколько значений из функций.

let http404Error: (Int, String) = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")


//: ## Задачи

//: #1
//let 你好 = "你好世界"
//let π = 3.14159
//let 🔥 = "АГОНЬ"

//: #2
//let dog: String
//dog = "Some dog"

//: #3
//let someNumber = 0_0_0_0_0123.4_56
//print(someNumber)

//: #4
//var cat = "?"; cat = "CAT"; print(cat);

//: #5
//typealias CustomInt = Int
//let customIntValue: CustomInt = 100
//print(customIntValue)

//: [Next](@next)
