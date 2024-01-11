import UIKit

var greeting = "Hello, playground"
//Structs
// Structs are one of the ways Swift lets us create our own data types out of several small types.
//most of Swift’s own types are implemented as structs, including String, Int, Bool, Array, and more.

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) \(year) by \(artist)")
    }
}

//creates a new type called Album that has 3 properties and a method.
//types start with a capital letter.

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

//if in a struct we want to modify any property inside of a method, we have to mark the method with mutating.

//if a struct instance is a constant, it's properties are constant too.
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

//variables + constants inside a struct = properties
//functions inside a struct = methods
//when we create a constant or a variable from our struct = instance
//when we create an instance of a struct we call this using an initializer.

//if we have a constant property that has a default value in a struct, when we create an instance, we get 1 initializer that doesn't contain that property that has a default value.
//if we have a variable that has a defaul value in a struct, when we create an instance, we get 2 initializers, one with the default value and one without.

//computed property vs stored property
//a stored property is a variable or constant that holds a piece of data inside an instance of the struct, and a computed property calculates the value of the property dynamically every time it’s accessed.
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer2 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)

//Computed properties must always have an explicit type.
// Constants cannot be computed properties.

//Property Observers
//didSet observer to run when the property just changed, and a willSet observer to run before the property changed.
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
game.score += 1


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

//custom initializers
//you MUST ensure every property inside your struct has initial value by the time your initializer finishes.

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)

//Access Properties
//By default, Swift’s structs let us access their properties and methods freely

struct BankAccount {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/*
 private -> don’t let anything outside the struct
 fileprivate -> don’t let anything outside the current file
 public -> let anyone, anywhere
 private(set) -> let anyone read this property, but only let my methods write it.
 */

struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])

//Static properties and methods
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
//Notice the keyword static in there, which means both the studentCount property and add() method belong to the School struct itself, rather than to individual instances of the struct.

School.add(student: "Taylor Swift")
print(School.studentCount)

//Use Self to refer to the current type.
//Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.

//Checkpoint #6
struct Car {
    private let model: String
    private let numberOfSeats: Int
    public var currentGear: Int
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    
    mutating func change(gear: Int) {
        if gear > currentGear {
            currentGear = gear
        } else if gear < currentGear {
            currentGear = gear
        }
    }
}

var car = Car(model: "Ford", numberOfSeats: 4, currentGear: 2)
car.currentGear = 1
print(car.currentGear)
