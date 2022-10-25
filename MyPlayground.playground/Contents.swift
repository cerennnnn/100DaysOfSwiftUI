import UIKit

//mutating

//example1
class Pizza {
    private var toppings = [String]()
    func add(topping: String) {
        toppings.append(topping)
    }
}
var pizza = Pizza()
pizza.add(topping: "Mushrooms")

//example2
struct Park {
    var numberOfFlowers = 1000
    mutating func plantFlowers() {
        numberOfFlowers += 50
    }
}
var park = Park()
park.plantFlowers()

//example3
struct Piano {
    var untunedKeys = 3
    mutating func tune() {
        if untunedKeys > 0 {
            untunedKeys -= 1
        }
    }
}
var piano = Piano()
piano.tune()

//example4
class Light {
    var onState = false
    func toggle() {
        if onState {
            onState = false
        } else {
            onState = true
        }
        print("Click")
    }
}
let light = Light()
light.toggle()

//example5
struct Code {
    var numberOfBugs = 100
    mutating func fixBug() {
        numberOfBugs += 3
    }
}
var code = Code()
code.fixBug()

//example6
class Phasers {
    var energyLevel = 100
    func firePhasers() {
        if energyLevel > 10 {
            print("Firing!")
            energyLevel -= 10
        }
    }
}
var phasers = Phasers()
phasers.firePhasers()

//example7
struct Barbecue {
    var charcoalBricks = 20
    mutating func addBricks(_ number: Int) {
        charcoalBricks += number
    }
}
var barbecue = Barbecue()
barbecue.addBricks(4)

