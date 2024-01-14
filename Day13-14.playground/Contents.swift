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

//let trimmed = quote.trimmed()

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

//Checkpoint #8
protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var estateAgentName: String { get set }
    
    func summary() -> String
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var estateAgentName: String

    func summary() -> String {
        return "House - Rooms: \(rooms), Cost: $\(cost), Agent: \(estateAgentName)"
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var estateAgentName: String

    func summary() -> String {
        return "Office - Rooms: \(rooms), Cost: $\(cost), Agent: \(estateAgentName)"
    }
}

var myHouse = House(rooms: 3, cost: 300000, estateAgentName: "Dream Homes Realty")
print(myHouse.summary())

var myOffice = Office(rooms: 10, cost: 1000000, estateAgentName: "Corporate Properties")
print(myOffice.summary())

//optionals
//might have a value or might not

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

//guard-let
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

//nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

//optional chaining
//Optional chaining allows us to say “if the optional has a value inside, unwrap it then…” and we can add more code.

//When we call a function that might throw errors, we either call it using try and handle errors appropriately, or if we’re certain the function will not fail we use try! and accept that if we were wrong our code will crash.
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

//Checkpoint #9
func randomInt(arr: [Int]?) -> Int {
    arr?.isEmpty == true ? Int.random(in: 1...100) : arr!.randomElement() ?? 0
}

let result = randomInt(arr: [1, 2, 3, 4, 5])
print(result)
