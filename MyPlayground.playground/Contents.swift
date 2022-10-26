import UIKit

//opeque return types

//let's implement 2 simple functions
func getRandomNumber() -> some Equatable {
    return Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    return Bool.random()
}

getRandomBool()
getRandomNumber()

print(getRandomNumber() == getRandomNumber())
