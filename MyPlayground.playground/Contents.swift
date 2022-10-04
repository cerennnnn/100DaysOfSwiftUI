import UIKit

//how to customize parameter labels

func rollDice(sides: Int, count: Int) -> [Int] {
//    start with an empty array
    var rolls = [Int]()
    
//    roll as many dice as needed
    for _ in 1...count {
//        add each result to our array
        let roll = Int.random(in: 1...6)
        rolls.append(roll)
    }
    
//    send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count:4)

//if we add an underscore before the parameter name, we can remove the external parameter label

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)
 
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

//the external parameter name is for, the internal parameter name is number anx it's of type Int.
//when we call the function we use the external name for the parameter
//inside the function we use the internal name for the parameter

//So, Swift gives us 2 important ways to control parameter names: we can use _ for the external parameter name so that it doesn't get used, or add a 2nd name there so that we have bot h external and internal parameter names.

//technically values you pass in to a function are called 'arguments' and values you receive inside the function are called parameters.
