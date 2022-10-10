import UIKit

//trailing closures

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

//we don't need to specify the types of our parameters bc they must be strings, and we don't need to specify a return type bc it must be a Boolean

//let captainFirstTeam = team.sorted(by: { name1, name2 in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//})

//trailing closure syntax
//when one function accepts another as its parameter, Swift allows special syntax called trailing closure

let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

print(captainFirstTeam)

//There's one last way Swifr can make closures less cluttered: Swift can automatically provide parameter names for us, using shorthand syntax.
//With this syntax we don't even write name1, name2 in anymore, instead rely on specially named values that Swift provies for us : $0 and $1 for the 1st and 2nd strings respectively.

let captainFirstTeam1 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

//filter() lets us run some code on every item in the array and will send back a new array containing every item that returns true for the function.

//we could find all team players whose name begins with T like this:

let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

//map() lets us transform every item in the array using some code of our own choosing, and sends back a new array of all the transformed items:
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

//That will print ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"], because it has uppercased every name and produced a new array from the result.

//When working with map(), the type you return doesn’t have to be the same as the type you started with – you could convert an array of integers to an array of strings, for example.

//closures as parameters
//example - 1
var swift = {
    print("Cool - I can use closures!")
}

func writeCode(using language: () -> Void) {
    language()
    print("That'll be eleventy billion dollar, please.")
}

writeCode(using: swift)

//example - 2
var playWithDog = {
    print("fetch!")
}

func play(using playType: () -> Void) -> String {
    print("Let's play a game")
    playType()
    return "👍"
}
play(using: playWithDog)

//example - 3
let awesomeTalk = {
    print("Here's a great talk!")
}

func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}

deliverTalk(name: "My Awesome Talk", type: awesomeTalk)

//example - 4
let evilRobot = {
    print("EXTERMINATE")
}

func buildRobot(using personality: () -> Void) {
    print("Time to turn on the robot!")
    personality()
}

buildRobot(using: evilRobot)

//example - 5
let resignation = { (name: String) in
    print("Dear \(name), I'm outta here!")
}

func printDocument(contents: (String) -> Void) {
    print("Connecting to printer... Sending document...")
    contents("Josh")
}

printDocument(contents: resignation)

//example - 6
let driveSafely = { () -> String in
    return "I'm being a considerate driver."
}

func drive(using driving: () -> String) {
    print("Let's get in the car")
    driving()
    print("We're there!")
}

drive(using: driveSafely)
