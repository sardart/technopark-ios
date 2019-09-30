//: [Previous](@previous)

import Foundation

/*: Протоколы
 
 С наследованием есть одна проблема: моно иметь только одного родителя. А как быть в случае, если мы хотим описать несколько типов поведения и комбинировать их в своих классах?
 
 Здесь на помощь приходят _протоколы_, которые специфицируют _контракт_ класса. При этом класс может реализовывать несколько протоколов одновременно.
 
 Давайте переделаем предыдущий пример с фигурами с помощью протокола и посмотрим, как его можно расширить.
 */

protocol AreaCalculatable {
    
    func area() -> Double
}

class Circle: AreaCalculatable {
    private let radius: Double
    
    init(with radius: Double = 1.0) {
        self.radius = radius
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

class Rect: AreaCalculatable {
    
    private let width: Double
    private let height: Double
    
    init(width: Double = 1.0, height: Double = 1.0) {
        self.height = height
        self.width = width
    }
    
    func area() -> Double {
        return width * height
    }
}

class Square: Rect {
    
    init(side: Double = 1.0) {
        super.init(width: side, height: side)
    }
}

let circle = Circle(with: 1.0)
print(circle.area())

let rect = Rect(width: 1.0, height: 3.0)
print(rect.area())

let square = Square(side: 2.0)
print(square.area())

/*:
 
 Пока особо ничего не поменяось, кроме того, что убралось `overrides` и пропало пустое тело метода `area` в базовом классе.
 
 Давайте тепеь представим, что мы хотим считать не только площадь, но и объём цилиндра с таким основанием и какой-то высотой.
*/

protocol Cylinder {
    func volume(height: Double) -> Double
}

extension Circle: Cylinder {
    func volume(height: Double)  -> Double {
        return area() * height
    }
}

extension Rect: Cylinder {
    func volume(height: Double)  -> Double {
        return area() * height
    }
}

print(circle.volume(height: 3.0))
print(rect.volume(height: 3.0))
print(square.volume(height: 3.0))


/*:
 
 Вроде всё ок, но можно сделать ещё лучше. Мы можем задавать релизацию метода протокола по-умолчанию. Причем только для определённых типов
 */

protocol Cylinder2 {
    func volume2(height: Double) -> Double
}

extension Cylinder2 where Self: AreaCalculatable {
    func volume2(height: Double) -> Double {
        return height*area()
    }
}

extension Circle: Cylinder2 {
    
}

extension Rect: Cylinder2 {
    
}

print(circle.volume2(height: 3.0))
print(rect.volume2(height: 3.0))
print(square.volume2(height: 3.0))

//: [Next](@next)
