import UIKit

//How to compute property values dynamically

//structs have 2 kinds of property: a stored property & a computed property
//a stored property is a variable or constant that holds piece of data inside an instance of the struct
//a computed property is calculates the value of the property dynamically every time it's accessed. This means computed properties are a blend of both stored properties and functions: they're accessed like stored properties but work like functions.

//an Employee struct that could track how many days of vacation remained for that employee

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaing: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationRemaing)

//this is really powerful bc we're reading what looks like a prooperty but bts Switf's running some code its calculated every time.
//we need to provide a getter and a setter to read and write code respectively.

//get and set mark individual pieces of code to run when reading or writing a value.
//newValue is automatically provided to us by Swift, nd stores whatever alue the user was trying to assign to the property.
//with both a getter and setter in place, we can now modify vacationRemaining:
archer.vacationRemaing += 5
print(archer.vacationAllocated)

