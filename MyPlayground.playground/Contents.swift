import UIKit

var favoriteMovie: String? = nil
favoriteMovie = "The Life of Brian"

if let favoriteMovie = favoriteMovie {
    print("Your favorite movie is \(favoriteMovie)")
} else {
    print("You don't have a favorite movie.")
}

//example2
let song: String? = "Shake It Off"

if let unwrappedSong = song {
    print("The name has \(unwrappedSong.count) letters.")
}

//example3
let currentDestination: String? = nil
if let destination = currentDestination {
    print("We're walking to \(destination).")
} else {
    print("We're just wandering.")
}

//example4
let menuItems: [String]? = ["Pizza", "Pasta"]

if let items = menuItems {
    print("There're \(items.count) items to choose.")
}

//example5
let album = "Red"
let albums = ["Big Reputation", "Red", "1989"]

if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

//example6
let userAge: Int? = 38
if let age = userAge {
    print("You are \(age) years old.")
}

//example7
let favoriteTennisPlayer: String? = "Andy Murray"
if let favoriteTennisPlayer {
    print("Let's watch \(favoriteTennisPlayer)'s highlights video on YouTube.")
}

//example8
var winner: String? = nil
winner = "Daley Thompson"

if let winner {
    print("And the winner is... \(winner)")
}

//example9
var bestScore: Int? = nil
bestScore = 101

if let score = bestScore {
    print("You got a high score \(score)!")
} else {
    print("Better luck next time!")
}
