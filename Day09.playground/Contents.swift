import UIKit

//Closures
//when u copy a function, u don't put the paranthesis

//it takes no parameters and returns nothing
let sayHello = {
    print("Hi there!")
}
 sayHello

//a chunk of code we can pass around and call whenever we want.
//closures start with { and end with }

let sayHello2 = { (name: String) -> String in
    "Hi, \(name)"
}

sayHello2("Ceren")

//in keyword marks the end of the parameters and return type, and the start of the closure

func greetUser() {
    print("Hi there!")
}

var greetCopy: () -> Void = greetUser
//when a closure doesn't return a value, it needs to be written like above

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymus"
    }
}

let data: (Int) -> String = getUserData(for:)
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeam2)

func pay(user: String, amount: Int) {
    //code
}

//the same code written with closures:
let payment = {(user: String, amount: Int) in
    //code
}

//Closures cannot use external parameter labels.
//When calling closures we don't write parameters.

//shorthand syntax
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

//accept functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

//Checkpoint #5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let evenLuckyNumbers = luckyNumbers.filter { $0.isMultiple(of: 2) }
let sortedNumbers = luckyNumbers.sorted(by: <)
let mappedNumbers = luckyNumbers.map { "\($0) is a lucky number." }
print(mappedNumbers)
