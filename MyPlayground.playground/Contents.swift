import UIKit

func random(arr: [Int]? ) -> Int {
    return arr?.randomElement() ?? Int.random(in: 1...100)
}

random(arr: (nil))

class Dog {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}

var dog = Dog(age: 5)
var playfulDog = dog
playfulDog.age = 10

print(dog.age, playfulDog.age)

enum UIStyle {
    case light, dark, sydstem
}

var style: UIStyle = .dark


var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

var teams: [String] = [String]()
var clues = [String]()
var arr: [String]

var hate = ""
var lyric = "Hater's gonna \(hate)"

for _ in 1...5 {
    lyric += "hate "
}
print(lyric)

func getUser() -> (firstName: String, lastName: String ) {
    (firstName: "Taylor", lastName: "Swift")
}

var name = getUser().firstName
print(name)

func upperCasse( _ string: String ) -> Bool {
    string == string.uppercased()
}
upperCasse("TAYLOR")

func multiply(with number: Int) {
    for i in 1...5 {
        print("\(i) x \(number) is \(i * number)")
    }
}

multiply(with: 3)

struct Employee {
    var name: String
    var vacationAllowed = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllowed - vacationTaken
        }
        set {
            vacationAllowed = vacationTaken + newValue
        }
    }
}

var emp = Employee(name: "Emp1")
emp.vacationRemaining

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]
if guests.isNotEmpty {
    print("Guests count: \(guests.count)")
}
