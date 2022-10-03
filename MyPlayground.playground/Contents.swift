import UIKit

//when our code can be boiled down to a single value, such as true, false, "Hello", or 19, it's called an 'expression'. Expressions are things that can be assigned to a variable, or printed using print().
//when we're performing actions such as creating variables, starting a loop, or checking a condition, then it's called a 'statement'.
//the expression inside there can be as long as you want, but it can't contain any statements - no loops, no conditions, no new variables, and so on.

func greet(name: String) -> String{
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

//if we have actual if else statements omitting return keyword inside if and else is not allowed.
func read(books: [String]) -> Bool {
    for book in books {
        print("I'm reading \(book)")
    }
    return true
}
read(books: ["Harry Potter 1", "Harry Potter 2"])

//tuples
//like arrays, dictionaries and sets, tuples lets us put multiple pieces of data into a single variable, but they are fixed in size and can have a vaariety of data types.

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

// sometimes you’ll find you’re given tuples where the elements don’t have names. When this happens you can access the tuple’s elements using numerical indices starting from 0
print("Name: \(user.0) \(user.1)")

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

//if you don’t need all the values from the tuple you can go a step further by using _ to tell Swift to ignore that part of the tuple:
//let (firstName, _) = getUser()
//print("Name: \(firstName)")
