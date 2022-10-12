import UIKit

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

//When you’re referring to a data type, we use camel case where the first letter is uppercased, but when you’re referring to something inside the type, such as a variable or function, we use camel case where the first letter is lowercased.

let red = Album(title: "Red", artist: "Taylor Swoft", year: 2012)

print(red.title)
red.printSummary()


struct Employee {
    let name: String
//    var vacationRemaining: Int
    var vacationRemaining = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("i'm going on vacation")
            print("Day's remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

//eger let ile bir instance yaratirsak struct'in icindeki tum veriler constant olur ve degistirmeye calisirsak hata verir, o yuzden mutating keyword'u kullanilir.
//trying to call a mutating function on a constant struct is NOT allowed.
//variables and constants that belong to structs are called properties.
//functions that belong to structs are called methods.
//when we create a constant or variable out of a struct, it's called an instance.
//when we create instances of structs we do it with using an initializer.

//creating an instance of a struct
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

//if our struct had these two properties
let name: String
var vacationRemaining = 14
//then Swift will silently generate an initializer with a default value of 14 for vacationRemaining, makeing both of these valid:
let poovey = Employee(name:"Pwm Pooveyww" , vacationRemaining: 35)
let kane = Employee(name: "Lane Kane")
