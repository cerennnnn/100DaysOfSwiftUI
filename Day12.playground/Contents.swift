import UIKit

//Classes
//Another way to create custom data type

/*
 1- You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
 2- Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
 3- When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
 4- When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
 5- Even if you make a class constant, you can still change its properties as long as they are variables.
 */


//All copies of a class share the same data
//Because one instance of a class can be referenced in several places, it becomes important to know when the final copy has been destroyed. That’s where the deinitializer comes in: it allows us to clean up any special resources we allocated when that last copy goes away.

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//If a class do not have a property, we cannot write an initializer.(obviously)

//Inheritance
//Swift lets us create classes by basing them on existing classes
//When one class inherits functionality from another class (its “parent” or “super” class), Swift will give the new class access (the “child class” or “subclass”) to the properties and methods from that parent class, allowing us to make small additions or changes to customize the way the new class behaves.

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

//We could make two subclasses of Employee, each of which will gain the hours property and initializer:

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

//Notice how those two child classes can refer directly to hours – it’s as if they added that property themselves, except we don’t have to keep repeating ourselves.

//Each of those classes inherit from Employee, but each then adds their own customization. So, if we create an instance of each and call work(), we’ll get a different result:
let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

//Because Developer inherits from Employee, we can immediately start calling printSummary() on instances of Developer, like this:

let novall = Developer(hours: 8)
novall.printSummary()

//So, if we wanted developers to have a unique printSummary() method, we’d add this to the Developer class:

/*
 override func printSummary() {
     print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
 }
 */

//If you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.

//Initializers
// if a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties, if it has any.

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

//"super" is another one of those values that Swift automatically provides for us, similar to self: it allows us to call up to methods that belong to our parent class, such as its initializer. You can use it with other methods if you want; it’s not limited to initializers.
let teslaX = Car(isElectric: true, isConvertible: false)

//example
class Shape {
    var sides: Int
    init(sides: Int) {
        self.sides = sides
    }
}
class Rectangle: Shape {
    var color: String
    init(color: String) {
        self.color = color
        super.init(sides: 4)
    }
}

//In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

//In comparison, structs do not share their data amongst copies, meaning that if we change class User to struct User in our code we get a different result: it will print “Anonymous” then “Taylor”, because changing the copy didn’t also adjust the original.

//If you want to create a unique copy of a class instance – sometimes called a deep copy – you need to handle creating a new instance and copy across all your data safely.

class User2 {
    var username = "Anonymous"

    func copy() -> User2 {
        let user = User2()
        user.username = username
        return user
    }
}

//Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.

//The technical term for this distinction is “value types vs reference types.” Structs are value types, which means they hold simple values such as the number 5 or the string “hello”. It doesn’t matter how many properties or methods your struct has, it’s still considered one simple value like a number. On the other hand, classes are reference types, which means they refer to a value somewhere else.


//Swift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it’s created.


/*
 This comes with a few small provisos:

 Just like initializers, you don’t use func with deinitializers – they are special.
 Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
 Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
 We never call deinitializers directly; they are handled automatically by the system.
 Structs don’t have deinitializers, because you can’t copy them.
 */

class User3 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

/*
 Exactly when your deinitializers are called depends on what you’re doing, but really it comes down to a concept called scope. Scope more or less means “the context where information is available”, and you’ve seen lots of examples already:

 If you create a variable inside a function, you can’t access it from outside the function.
 If you create a variable inside an if condition, that variable is not available outside the condition.
 If you create a variable inside a for loop, including the loop variable itself, you can’t use it outside the loop.
 */

var users = [User3]()

for i in 1...3 {
    let user = User3(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")


// the deinitializer is only called when the last remaining reference to a class instance is destroyed. This might be a variable or constant you have stashed away, or perhaps you stored something in an array.

//One small but important feature of classes is that they can have a deinitializer function – a counterpart to init() that gets run when the class instance gets destroyed. Structs don’t have deinitializers, which means we can’t tell when they are destroyed.

//The job of deinitializers is to tell us when a class instance was destroyed. For structs this is fairly simple: the struct is destroyed when whatever owns it no longer exists. So, if we create a struct inside a method and the methods ends, the struct is destroyed.


//Behind the scenes Swift performs something called automatic reference counting, or ARC. ARC tracks how many copies of each class instance exists: every time you take a copy of a class instance Swift adds 1 to its reference count, and every time a copy is destroyed Swift subtracts 1 from its reference count. When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.

//Checkpoint #7
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof woof!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    func speak() {
        print("Meow meow!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("woof woof! - Corgi")
    }
}

class Poodle: Dog {
    override func speak() {
        print("woof woof! - Poodle")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meow meow! - Persian")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar")
    }
}
