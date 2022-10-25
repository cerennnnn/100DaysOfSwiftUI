import UIKit

//How to create a deinitializer for a class
//Swift classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it's created.
//This comes with a few small provisos:
//1 - just like initializers, you don't use the func keyword with deinitializers - they're special.
//2 - Deinitializers can never take parameters or return data, and as a result aren't even written with parentheses.
//3 - Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//4 - We never call deinitializers directly; they are handled automatically by the system.
//5 - Structs don’t have deinitializers, because you can’t copy them.

//Exactly when your deinitializers are called depends on what you’re doing, but really it comes down to a concept called scope. Scope more or less means “the context where information is available”, and you’ve seen lots of examples already:
//If you create a variable inside a function, you can’t access it from outside the function.
//If you create a variable inside an if condition, that variable is not available outside the condition.
//If you create a variable inside a for loop, including the loop variable itself, you can’t use it outside the loop.

//When a value exits scope we mean the context it was created in is going away. In the case of structs that means the data is being destroyed, but in the case of classes it means only one copy of the underlying data is going away – there might still be other copies elsewhere. But when the final copy goes away – when the last constant or variable pointing at a class instance is destroyed – then the underlying data is also destroyed, and the memory it was using is returned back to the system.

//To demonstrate this, we could create a class that prints a message when it’s created and destroyed, using an initializer and deinitializer:

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

//if we create a User instance inside the loop, it'll be destroyed when the loop iteration finishes:
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

//When that code runs you’ll see it creates and destroys each user individually, with one being destroyed fully before another is even created.
//
//Remember, the deinitializer is only called when the last remaining reference to a class instance is destroyed. This might be a variable or constant you have stashed away, or perhaps you stored something in an array.
//
//For example, if we were adding our User instances as they were created, they would only be destroyed when the array is cleared:

var users = [User]()
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}
print("Loop is finished!")
users.removeAll()
print("Array is clear!")
