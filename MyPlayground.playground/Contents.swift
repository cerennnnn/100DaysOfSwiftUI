import UIKit

//how to return values from functions

//to return your own value from a function do 2 things:
//1st - write -> then a data type before { to tell Swift what kind of data will sent back
//2nd - use the return keyword to send back your data

//example
func rollDice() -> Int {
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

//if the function doesn't return a value, you can still use return by itself to force the function to exit early.
