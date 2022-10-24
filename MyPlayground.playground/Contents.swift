import UIKit

//classes

//similarities between classes and structs
// - you get to create and name them.
// - you can add properties and methods, including property observers and access control.

//differences between classes and structs
// - you can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively overried some methods, you can do that too.
// - bc of that 1st point, Swift won't automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
// - when you copy an instance of a class, both copies share the same data - if you change one copy, the other one also changes.
// - when the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
// - even if you make a class constant, you can still change its properties as long as they are variables.

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var newGame = Game()
newGame.score += 10

//example1
class Painting {
    var title: String
    var artist: String
    var paintType: String
    init(title: String, artist: String, paintType: String) {
        self.title = title
        self.artist = artist
        self.paintType = paintType
    }
}

//example2
class Sandwich {
    var name: String
    var fillings: [String]
    
    init(name: String, fillings: [String]) {
        self.name = name
        self.fillings = fillings
    }
}
let blt = Sandwich(name: "BLT", fillings: ["Bacon", "Lettuce", "Tomato"])
print(blt.name)

//example3
class ThemePark {
    var entryPrice: Int
    var rides: [String]
    init(rides: [String]) {
        self.rides = rides
        self.entryPrice = rides.count * 2
    }
}

//!!!all properties must have a value before the initializer ends.

//example4
class Empty { }
let nothing = Empty()
