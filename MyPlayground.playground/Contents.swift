import UIKit

//variables

//var keyword creates a new variable and it can be changed over and over again.

var name = "Ted"
name = "Rebecca"

//constants

//let keyword creates a new constant and it cannot be changed once it's created.

let character = "Daphne"

//Swift's naming convention is camelCase

//strings
//when you assign text to a constant or variable it's called a string.
//you can use "" inside of your string as long as you put backslash before them.

let quote = "Then he tapped a sign saying \"Believe\" and walked away. "

//multiline strings can be made using triple double quotes on seperate lines.

let movie = """
A day in
the life of an
Apple engineer
"""

//you can read the length of a string by writing .count after the name of the variable or constant
print(movie.count)

//uppercased() function sends back the same string except every one of its letter is uppercased.
print(movie.uppercased())

//hasPrefix() function lets us know whether a string starts with some letters of our choosing
print(movie.hasPrefix("A day"))

//strings in Swift are case-sensitive.

//whole numbers - Integers(Int) which in latin means whole

//create a score constant like this
let score = 10

//use _ to break up numbers however you want.
let reallyBig = 100_000_000

//this creates a counter variable equal to 10, then adds 5 more to it
var counter = 10
counter = counter + 5

//you can use shorthand operator += which adds a number directly to the integer and it is called compound assignment operator
counter += 5

//isMultiple(of: ) function finds out whether it's a multiple of another integer.
let number = 120
print(number.isMultiple(of: 3))

//you can use the number directly if you want
print(120.isMultiple(of: 3))


//Decimal numbers
//when you create a floating-point number, Swift considers it to be a Double

let num = 0.1 + 0.2
print(num)

//you cannot mix together different types(for ex: int + double will give you an error.) It is called type safety.

//if you want to add a float to an integer
let a = 1
let b = 2.0
let c = a + Int(b)
//or let c = Double(a) + b

//if you wanted to create a Double or an Int based on the number you provide - if there's a dot in there, you have a Double otherwise it's an Int. Even if the numbers after the dot are 0.

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

//decimal numbers have the same range of operators and compound assingment operators as integers
var rating = 5.0
rating *= 2

let roll = Int.random(in: 1...6)

//functions

//this function takes 2 parameters an integer called number and an endpoint called end
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number) ")
    }
}

printTimesTables(number: 2, end: 4)

func presents(gifts: [Int]) {
    for gift in gifts {
        print(gift)
    }
}

presents(gifts: [1, 4, 3, 5])

func square(numbers: [Int]) {
    for number in numbers {
        let squared = number * number
        print("\(number) squared is \(squared)")
    }
}

square(numbers : [1, 2, 3])
