import UIKit

//optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let names2 = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names2["Vincent"]?.first?.uppercased()

//example1
let songs: [String]? = [String]()
let finalSong = songs?.last?.uppercased()

//example2
func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}
let album = albumReleased(in: 2006)?.uppercased()

//example3
let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list")

//example4
let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()
