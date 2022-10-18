import UIKit

//How to take action when a property changes

//Swift lets us create property observers whoch are special pieces of code that run when properties change. These takes 2 forms: a didSet observer to run when the property just changed and a willSet observer to run before the property changed.

//to see why property observers might be needed, this abt code like this:
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

//if you want it, Swift automatically provides the constant oldValue inside didSet, in case you need to have custom functionality based on what you were changing from.
//there's also a willSet variant that runs some code before the property changes, which in turn provides the new value that will be assigned in case you want to take different action based on that.

//We can demonstrate all this functionality in action using one code sample, which will print messages as the values change so you can see the flow when the code is run:
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

//Yes, appending to an array will trigger both willSet and didSet, so that code will print lots of text when run.

//In practice, willSet is used much less than didSet, but you might still see it from time to time so it’s important you know it exists. Regardless of which you choose, please try to avoid putting too much work into property observers – if something that looks trivial such as game.score += 1 triggers intensive work, it will catch you out on a regular basis and cause all sorts of performance problems.

//example
struct Game {
    var score: Int {
        didSet {
            print("Your score is now \(score).")
        }
    }
}

