import UIKit

class Animal {
    var legs: Int
    
    func speak() {
    }
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof woof!")
    }
    
    override init(legs: Int) {
        super.init(legs: legs)
    }
}

class Corgi: Dog {
    override func speak() {
        print("I'm a Corgi.")
    }
    
    override init(legs: Int) {
        super.init(legs: legs)
    }
}

class Poodle: Dog {
    override func speak() {
        print("I'm a Poodle.")
    }
    
    override init(legs: Int) {
        super.init(legs: legs)
    }
}

class Cat: Animal {
    var isTame: Bool
    
    override func speak() {
        print("Meow!")
    }
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
}

var poodle = Poodle(legs: 4)
poodle.speak()
print(poodle.legs)

var corgi = Corgi(legs: 4)
corgi.speak()
print(corgi.legs)

var cat = Cat(legs: 4, isTame: true)
print(cat.isTame, cat.legs)
cat.speak()
