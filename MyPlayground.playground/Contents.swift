import UIKit

//the difference between a struct and a tuple

//a tuple is just a struct without a name, like an anonymous struct. This means you can define it as (name: String, age: Int, city: String) and it'll do the same thing as the following struct:

struct User {
    var name: String
    var age: Int
    var city: String
}

//when you want to return several pieces of data from a single function, tuples can be annoying to use again and again.
func authenticate( _ user: User) { }
//or
func authenticate( _ user: (name: String, age: Int, city: String)) { }

//So, use tuples when you want to return two or more arbitrary pieces of values from a function, but prefer structs when you have some fixed data you want to send or receive multiple times.

//the difference between a function and a method
//methods belong to a type, such as structs, enums, and classes, whereas functions do not.

//why do e need to mark methods as mutating?
//methods belong to a type, such as structs, enums, and classes, whereas functions do not.
//It’s possible to modify the properties of a struct, but only if that struct is created as a variable. Of course, inside your struct there’s no way of telling whether you’ll be working with a variable struct or a constant struct, so Swift has a simple solution: any time a struct’s method tries to change any properties, you must mark it as mutating.
//Marking methods as mutating will stop the method from being called on constant structs, even if the method itself doesn’t actually change any properties. If you say it changes stuff, Swift believes you!
//A method that is not marked as mutating cannot call a mutating function – you must mark them both as mutating.

//example - 1
struct Diary {
    var entries: String
    mutating func add(entry: String) {
        entries += "\(entry)"
    }
}

//example - 2
struct Surgeon {
    var operationsPerformed = 0
    mutating func operate(on patient: String) {
        print("Nurse, hand me the scalpel!")
        operationsPerformed += 1
    }
}

//struct Car {
//    let mileage: Int
//    mutating func drive(distance: Int) {
//        mileage += distance
//    }
//}

//let is immutable so we need to change it as var

struct Switch {
    var isOn: Bool
    mutating func toggle() {
        if isOn {
            isOn == false
        } else {
            isOn == true
        }
    }
}

struct MeetingRoom {
    var isBooked = true
    mutating func book(for name: String) {
        if isBooked {
            print("Sorry, the meeting room is already taken.")
        } else {
            isBooked = true
            print("It's reserved for \(name).")
        }
    }
}

struct Delorean {
    var speed = 0
    mutating func accelerate() {
        speed += 1
        if speed == 88 {
            travelThroughTime()
        }
    }
    func travelThroughTime() {
        print("Where we're going we don't need roads.")
    }
}

struct Bicycle {
    var currentGear: Int
    mutating func changeGear(to newGear: Int) {
        currentGear = newGear
        print("I'm now in gear \(currentGear).")
    }
}
