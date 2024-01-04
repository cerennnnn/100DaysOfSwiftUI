import UIKit

//Type annotations
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

let username: String //username will contain a string at some point
username = "@twostraws"

//Checkpoint #2
let stringArray = ["First", "Second", "Third", "Second", "Third"]
print(stringArray.count)

let uniquesStringArray = Set(stringArray)
print(uniquesStringArray.count)
