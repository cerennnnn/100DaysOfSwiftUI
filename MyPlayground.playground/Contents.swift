import UIKit

//nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

//let new = captains["Serenity"]
//let new = captains["Serenity"] ?? "N/A"
let new = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    var author: String?
    var title: String
}

let book = Book(author: nil, title: "Beowulf")
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number = Int(input) ?? 0
print(number)


//example1
var bestPony: String? = "Pinkie Pie"
let selectedPony: String? = bestPony ?? nil

//example2
let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

//example3
let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

//example4
var userOptedIn: Bool? = nil
var optedIn = userOptedIn ?? false
