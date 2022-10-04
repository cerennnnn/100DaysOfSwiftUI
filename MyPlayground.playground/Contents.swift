import UIKit

//how to handle errors in functions

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

//being marked by throws doesn't mean the function must throw errors, only that it might
//try keyword must be written before calling all functions that might throw errors, and is a visual signal to developers that regular code execution will be interrupted if an error happens.
//when you use try, you need to be inside a do block, and make sure you have one or more catch blocks able to handle any errors.
//you must always have a catch block that is able to handle every kind of error. However, you can also catch specific errors as well


let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error .")
}

//Most errors thrown by Apple provide a meaningful message that you can present to your user if needed. Swift makes this available using an error value that's automatically provided inside your catch block, and it's common to read error.localizedDescription to see exactly what happened.
