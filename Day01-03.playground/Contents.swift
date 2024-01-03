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
//String concetanation
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

//String interpolation
let name2 = "Taylor"
let age = 26
let message = "Hello, my name is \(name2) and I'm \(age) years old."

//Checkpoint #1
var temp: Double = 5
let fahrenheitTemp = (temp * 9 ) / 5 + 32
print("Celcius: \(temp) = Fahrenheit: \(fahrenheitTemp)")

//Arrays
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

//1st item of beatles:
print(beatles[0])

//Add new item to the beatles:
beatles.append("Allen")

//Swift won’t let you mix these two different types together
//This is type safety, just like how Swift won’t let us mix integers and decimals.

//Another array syntax:
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

print(numbers.count)

//Another array syntax:
var albums = [String]()
albums.append("Fearless")
albums.append("Red")

albums.remove(at: 0)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

//Dictionaries
let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

//Another dictionary syntax:
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

archEnemies["Batman"] = "Penguin"

//Sets
//No duplicates, no index
var actors = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage"])
print(actors)

//Not appending but ✨inserting✨
actors.insert("Samuel L Jackson")

//coontains() runs SO fast on sets

//Enums
//A set of named values we can create and use in our code

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday
