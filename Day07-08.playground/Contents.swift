import UIKit

//Functions
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

//do two strings contain the same letters, regardless of their order?
func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

//pisagor teoremi
func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

//if your function doesn’t return a value, you can still use return by itself to force the function to exit early.

//when our code can be boiled down to a single value, such as true, false, “Hello”, or 19, we call that an expression.

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName, _) = getUser()
print("Name: \(firstName)")

//Default values for parameters
func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 8)

//removeAll(keepingCapacity: true) -> remove the items from the array and leave the array able to hold array.count items

//Handle Errors
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

//Checkpoint #4

enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func findSquareRoot(of number: Int) throws -> Int {
    
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    for i in 1...10_000 {
        let square = i * i
        
        if square == number {
            return i
        } else if square > number {
            break
        }
    }
    throw SquareRootError.noRoot
}

do {
    let result = try findSquareRoot(of: 25)
    print("Integer square root: \(result)")
} catch SquareRootError.outOfBounds {
    print("Error: Number out of bounds.")
} catch SquareRootError.noRoot {
    print("Error: No integer square root found.")
} catch {
    print("Unexpected error: \(error)")
}
