import UIKit

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        
//        1 - we *must* exit the function here
        return
    }
//    2 - `number`is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: 5)

//example1
func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}

let input = 5
if let doubled = double(number: input) {
    print("\(input) doubled is \(doubled)")
}

//example2
func playOpera(by composer: String?) -> String? {
    guard let composer = composer else { return "Please specify a composer." }
    if composer == "Mozart" {
        return "Le nozze di Figaro"
            } else {
                return nil
            }
    }

if let opera = playOpera(by: "Mozart") {
    print(opera)
}

//example3
func playScale(name: String?) {
    guard let name = name else {
        return
    }
    print("Playing the \(name) scale.")
}
playScale(name: "C")

//example4
func uppercase(string: String?) -> String? {
    guard let string = string else {
        return nil
    }
    return string.uppercased()
}
if let result = uppercase(string: "Hello") {
    print(result)
}

//example5
func isLongEnough(_ string: String?) -> Bool {
    guard let string = string else { return false }
    if string.count >= 8 {
        return true
    } else {
        return false
    }
}
if isLongEnough("Mario Odyssey") {
    print("Let's play that!")
}

//example6
func add3(to number: Int?) -> Int {
    guard let number = number else {
        return 3
    }
    return number + 3
}
let added = add3(to: 5)
print(added)

//example7
func validate(password: String?) -> Bool {
    guard let password = password else {
        return false
    }
    if password == "fr0sties" {
        print("Authenticated successfully!")
        return true
    }
    return false
}
validate(password: "fr0sties")

//example8
func test(number: Int?) {
    guard let number = number else { return }
    print("Number is \(number)")
}
test(number: 42)

//example9
func username(for id: Int?) -> String? {
    guard let id = id else {
        return nil
    }
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}

//example10
func describe(occupation: String?) {
    guard let occupation = occupation else {
        print("You don't have a job.")
        return
    }
    print("You are an \(occupation).")
}
let job = "engineer"
describe(occupation: job)

//example11
func plantTree(_ type: String?) {
    guard let type = type else {
        return
    }
    print("Planting a \(type).")
}
plantTree("willow")
