//: [Previous](@previous)
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


//: [Next](@next)
