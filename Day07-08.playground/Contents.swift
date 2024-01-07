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
