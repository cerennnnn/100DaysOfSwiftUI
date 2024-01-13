import UIKit

//Protocols & Extensions
//they let us define a series of properties and methods that we want to use, we expect a data type to support.

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

//now we can design types that work with that protocol. This means creating new structs, classes, or enums that implement the requirements for that protocol, which is a process we call adopting or conforming to the protocol.

//For example, we could make a Car struct that conforms to Vehicle, like this:

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

/*
 We tell Swift that Car conforms to Vehicle by using a colon after the name Car, just like how we mark subclasses.
 All the methods we listed in Vehicle must exist exactly in Car. If they have slightly different names, accept different parameters, have different return types, etc, then Swift will say we haven’t conformed to the protocol.
 The methods in Car provide actual implementations of the methods we defined in the protocol. In this case, that means our struct provides a rough estimate for how many minutes it takes to drive a certain distance, and prints a message when travel() is called.
 The openSunroof() method doesn’t come from the Vehicle protocol, and doesn’t really make sense there because many vehicle types don’t have a sunroof. But that’s okay, because the protocol describes only the minimum functionality conforming types must have, and they can add their own as needed.
 */


//You can conform to as many protocols as you need, just by listing them one by one separated with a comma. If you ever need to subclass something and conform to a protocol, you should put the parent class name first, then write your protocols afterwards.

//It's not possible to create set-only properties in Swift.
//It must either be only gettable or gettable & settable.

//Extensions
//Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let trimmed = quote.trimmed()

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

//custom memberwiser initializer
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

//protocol extensions
//we can extend a whole protocol to add method implementations, meaning that any types conforming to that protocol get those methods.

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

//example
protocol Politician {
    var isDirty: Bool { get set }
    func takeBribe()
}
extension Politician {
    func takeBribe() {
        if isDirty {
            print("Thank you very much!")
        } else {
            print("Someone call the police!")
        }
    }
}
