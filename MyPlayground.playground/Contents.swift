import UIKit

//Swift lets us create classes by basing them on existing classes, which is a process known as "inheritance".
//When one class inherits functionality from another class(it's 'parent' or 'super' class), Swift will give the new class access (the 'child class' or 'subclass') to the properties and methods from that parent class, allowing us to make small additions or changes to customize the way the new class behaves.

//To make one class inherit from another, write a colon after the child's class name. For example, here's an Employee class with one property and an initializer:

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

//we could make 2 subclasses of Employee, each of which will gain the hours property and initializer:
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

//Each of those classes inherit from Employee but each then adds their own customization. So, if we create an instance of each and call work(), we’ll get a different result:

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

//As well as sharing properties, you can also share methods, which can then be called from the child classes.

//Because Developer inherits from Employee, we can immediately start calling printSummary() on instances of Developer, like this:
let novall = Developer(hours: 8)
novall.printSummary()

//if a child class wants to change a method from a parent class, you must use override in the child class’s version. This does two things:
//If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.
//If you use override but your method doesn’t actually override something from the parent class, Swift will refuse to build your code because you probably made a mistake.

//Swift is smart about how method overrides work: if your parent class has a work() method that returns nothing, but the child class has a work() method that accepts a string to designate where the work is being done, that does not require override because you aren’t replacing the parent method.

//Tip: If you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.
