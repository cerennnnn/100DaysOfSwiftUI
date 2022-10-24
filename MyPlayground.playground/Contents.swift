import UIKit

//static properties and methods
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

//the static keyword means both the studentCount property and add() method belong to the School struct itself, rather than to individual instances of the struct.
//to use that code, we'd write the following:
School.add(student: "Taylor Swift")
print(School.studentCount)

//we haven't created an instance of School, we can literally use studentCount and add() directly on the struct. This is because those are both static, which means they don't uniquely exist on instances of the struct. It also explains why we're able to modify the studentCount property without marking the method as mutating, that's only needed with regular struct functions for times when an instances of struct was created as a constant, and there's no instance when calling add().

//if you want to mix and match static and non-static properties and methods, there're 2 rules:
//1 - To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
//2 - To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.

//Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.

//Tip: It’s easy to forget the difference between self and Self, but if you think about it it’s just like the rest of Swift’s naming – we start all our data types with a capital letter (Int, Double, Bool, etc), so it makes sense for Self to start with a capital letter too.

//2 ways to use static data
//1st: use static properties to organize common data in my apps. For example, I might have a struct like AppData to store lots of shared values I use in many places:
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

//Using this approach, everywhere I need to check or display something like my app’s version number – an about screen, debug output, logging information, support emails, etc – I can read AppData.version.

//2nd: to create examples of my structs. As you’ll see later on, SwiftUI works best when it can show previews of your app as you develop, and those previews often require sample data. For example, if you’re showing a screen that displays data on one employee, you’ll want to be able to show an example employee in the preview screen so you can check it all looks correct as you work.
//This is best done using a static example property on the struct, like this:



struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
//And now whenever you need an Employee instance to work with in your design previews, you can use Employee.example and you’re done.

//example1
struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}

//example2
struct Cat {
    static var allCats = [Cat]()
    init() {
        Cat.allCats.append(self)
    }
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}

//Referencing a static property inside a regular method isn't allowed

struct Person {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        Self.population += 1
    }
}
//either Self or Person can be used.

//example3
struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}


//example4
struct LegoBrick {
    static var numberMade = 0
    var shape: String
    var color: String
    init(shape: String, color: String) {
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}
