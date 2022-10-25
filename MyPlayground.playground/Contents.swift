import UIKit

//how to add initializers for classes
//if a child class has any custom initializers, it must always call the parent's initializer after it has finished setting up its own properties, if it has any.
//Swift won't generate a memberwise initializers for classes. So you either need to write your own initializer, or provide default values for all the properties of the class.

//let's start by defining a class
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

//That has a single Boolean property, plus an initializer to set the value for that property. Remember, using self here makes it clear we’re assigning the isElectric parameter to the property of the same name.

//Now, let’s say we wanted to make a Car class inheriting from Vehicle
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool, isElectric: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

//super is another one of those values that Swift automatically provides for us, similar to self: it allows us to call up to methods that belong to our parent class, such as it's initializer. You can use it with other methods if you want ; it's not limited to initializers.
