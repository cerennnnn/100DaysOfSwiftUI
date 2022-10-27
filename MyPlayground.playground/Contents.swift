import UIKit


let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    return number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
}

struct User {
    var name: String
}

let user: User? = User(name: "Linda")

if let name = user?.name {
    print("Username is \(name)")
}

func Username() -> String? {
    nil
}

if let username = Username() {
    print(username)
} else {
    print("nothing's here :/")
}
