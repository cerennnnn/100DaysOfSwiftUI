import UIKit

//Variables
var greeting = "Hello, playground"
//var = create a new variable

var name = "Ted"
name = "Rebecca"

//Constants
let character = "Daphne"
print(character)

//String
let actor = "Denzel Washington"

//Escaping character -> \
let quote = "Then he tapped a sign saying \"Believe\" ans walked away."

let movie = """
A day in
the life of an
Apple engineer
"""

print(character.count)
print(quote.uppercased())
print(movie.hasPrefix("A day"))

//Integers
let score = 10
let reallyBig = 100_000_000 //ignores _

//Compound assignment operator
var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))
120.isMultiple(of: 5)

//Decimal Numbers
//Double
let num = 0.1 + 0.2
