import UIKit

//How to copy classes
//In Swift, all copies of a class shares the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

//to see that, let's try this:
class User {
    var username = "Anonymous"
}
//That has just one property but because it's stored inside a class it'll get shared across all copies of the class. So we can create an instance of that class:
var user1 = User()
//we would then take a copy of user1 and change the username value
var user2 = user1
user2.username = "Taylor"
//now we've changed the copy of username property we can then print out the same properties from each different copy
print(user1.username)
print(user2.username)

//…and that’s going to print “Taylor” for both – even though we only changed one of the instances, the other also changed.

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
//Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original

