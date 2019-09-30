//: [Previous](@previous)

import Foundation

/*: # Поговорим про ООП
 
 ## Что это
 
 WIKI: Методология программирования, основанная на представлении программы в виде совокупности объектов, каждый из которых является экземпляром определённого класса, а классы образуют иерархию наследования
 
 ## Основные понятия
 
 ### Наследование
 
 Для быстрой и безопасной организации родственных понятий: чтобы было достаточно на каждом иерархическом шаге учитывать только изменения, не дублируя всё остальное, учтённое на предыдущих шагах
 
 ### Инкапсуляция
 
 Свойство системы, позволяющее объединить данные и методы, работающие с ними, в классе.
 
 ### Полиморфизм
 
 Свойство системы, позволяющее использовать объекты с одинаковым интерфейсом без информации о типе и внутренней структуре объекта
 
*/

class Shape {

    func area() -> Double {
        return 0.0
    }
}

class Circle: Shape {
    private let radius: Double
    
    init(with radius: Double = 1.0) {
        self.radius = radius
    }
    
    override func area() -> Double {
        return Double.pi * radius * radius
    }
}

class Rect: Shape {
    
    private let width: Double
    private let height: Double
    
    init(width: Double = 1.0, height: Double = 1.0) {
        self.height = height
        self.width = width
    }
    
    override func area() -> Double {
        return width * height
    }
}

class Square: Rect {
    
    init(side: Double = 1.0) {
        super.init(width: side, height: side)
    }
}

let circle: Shape = Circle(with: 1.0)
print(circle.area())

let rect: Shape = Rect(width: 1.0, height: 3.0)
print(rect.area())

let square: Shape = Square(side: 2.0)
print(square.area())

//ссылаются ли две константы или переменные на один и тот же экземпляр класса
print(square === rect)
//: [Next](@next)
