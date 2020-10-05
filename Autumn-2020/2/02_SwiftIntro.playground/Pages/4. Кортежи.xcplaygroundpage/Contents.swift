//: [Previous](@previous)
/*:

 # Кортежи

*/

let http404Error = (404, "Not Found")
// http404Error имеет тип (Int, String), и равен (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Выведет "The status code is 404"
print("The status message is \(statusMessage)")
// Выведет "The status message is Not Found"
//: Чаще всего используются для того, чтобы возвращать несколько значений из функций, как альтернатива замыканию(блокам), см. файл блоки

//: [Next](@next)

