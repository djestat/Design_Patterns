import UIKit
import Foundation

/*
 Еще один классический пример: создание различных вариаций кофе (простой, с молоком, с сахаром, с молоком и сахаром, со сливками, с молоком, сахаром и сливками и т. д.) с помощью декорирования — вместо создания большого количества сабклассов кофе.
 Создайте протокол Coffee и класс SimpleCoffee, реализующий протокол Coffee. Создайте протокол CoffeeDecorator, который «наследуется» от протокола Coffee. Далее создайте реализации декоратора — Milk, Whip, Sugar и другие, которые будут ингредиентами, которые добавляют в кофе. В протоколе Coffee объявите переменную cost: Int — это цена кофе. Каждый ингредиент должен увеличивать цену кофе на свою стоимость. Реализуйте описанную систему объектов с помощью паттерна Decorator аналогично тому, как это было сделано на уроке.
 */

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee: Coffee {
    var cost: Int {
        return 100
    }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init (base: Coffee)
}


class Milk: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var cost: Int {
        return base.cost + 20
    }
}

class Sugar: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var cost: Int {
        return base.cost + 10
    }
}

class Whip: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var cost: Int {
        return base.cost + 30
    }
}

let blackCoffee = SimpleCoffee()
let coffeeWithShugar = Sugar(base: blackCoffee)
let coffeeWithMilk = Milk(base: blackCoffee)
let coffeeWithWhip = Whip(base: blackCoffee)
let coffeeWithSugarAndMilk = Milk(base: coffeeWithShugar)
let coffeeWithSugarAndWhip = Whip(base: coffeeWithShugar)
let coffeeWithAllIngridients = Whip(base: coffeeWithSugarAndMilk)

print("\(blackCoffee.cost) руб.")
print("\(coffeeWithShugar.cost) руб.")
print("\(coffeeWithMilk.cost) руб.")
print("\(coffeeWithWhip.cost) руб.")
print("\(coffeeWithSugarAndMilk.cost) руб.")
print("\(coffeeWithSugarAndWhip.cost) руб.")
print("\(coffeeWithAllIngridients.cost) руб.")

