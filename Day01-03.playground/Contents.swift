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


//Bool = true || false
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

print(120.isMultiple(of: 12))

var goodDogs = true
goodDogs.toggle()

var isAuthenticated = true
!isAuthenticated

//Join strings

//string concetanation
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

//string interpolation
let name2 = "Taylor"
let age = 26
let message = "Hello, my name is \(name2) and I'm \(age) years old."

//Checkpoint #1
var temp: Double = 5
let fahrenheitTemp = (temp * 9 ) / 5 + 32
print("Celcius: \(temp) = Fahrenheit: \(fahrenheitTemp)")
