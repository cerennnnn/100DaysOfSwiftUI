import UIKit

//How to create custom initializers
//initializers are specified methods that are designed to prepared a new struct instance to be used.
//We have already seen how Swift silently generates one for us based on the properties we placed inside a struct, but we can also create our own as long as we follow 1 golden rule: all properties must have a value by the time he initializer ends.

//let's start by looking again at Swift's default initializer for structs:
struct Player {
    var name: String
    var number: Int
    
    init(name: String, number: Int) {
            self.name = name
            self.number = number
        }
    
    init(name: String) {
            self.name = name
            number = Int.random(in: 1...99)
        }

}

var player = Player(name: "Megan R", number: 15)

//that creates a new Player instance by providing values for its 2 properties. Swift call this the "memberwise initializer" which is a fancy way of saying an initializer that accepts each property in the order it was defined.

//the self keyword is used to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.

//By writing self.name we’re clarifying we mean “the name property that belongs to my current instance,” as opposed to anything else.

//Of course, our custom initializers don’t need to work like the default memberwise initializer Swift provides us with. For example, we could say that you must provide a player name, but the shirt number is randomized:

let player2 = Player(name: "Megan R")
print(player.number)

//You can add multiple initializers to your structs if you want, as well as leveraging features such as external parameter names and default values. However, as soon as you implement your own custom initializers you’ll lose access to Swift’s generated memberwise initializer unless you take extra steps to retain it. This isn’t an accident: if you have a custom initializer, Swift effectively assumes that’s because you have some special way to initialize your properties, which means the default one should no longer be available.
