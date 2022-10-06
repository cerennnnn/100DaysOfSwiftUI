import UIKit

//closures = function copies

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

//    when you're copying a function, you don't write the parantheses after it, if you put the parantheses there you are calling the function and assigning its return value back to something else

//basic closure definition
let sayHello = {
    print("Hi there!")
}

sayHello()

//closure that accepts parameters
let sayHello1 = { (name: String) -> String in
    "Hi, \(name)!"
}

//in keyword is used to mark the end of the parameters and return type - everything after that is the body of the closure itself

//Void and {} are the same thing.

//when we call closures we don't use external or internal parameter names
sayHello1("Taylor")

var greetCopy1: () -> Void = greetUser
//greetCopy1 is a closure that takes no parameters, returns nothing and doesn't throw errors.

//pass functions into another functions
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

//sorted() allows us to pass in a custom sorting function to control that. This function must accept 2 strings, and return true if the 1st string should be sorted before the 2nd, or false if the 1st string should be sorted after the 2nd.

//sorted() can be passed a function to create a custom sort order, and as long as that function a) accepts two strings, and b) returns a Boolean, sorted() can use it.

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}
//If neither name is Suzanne, just use < to do a normal alphabetical sort.

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeam1 = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
          return true
      } else if name2 == "Suzanne" {
          return false
      }

      return name1 < name2
})

print(captainFirstTeam1)
