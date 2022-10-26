import UIKit

//protocol examples
//example1
protocol Plantable {
    var requirements: [String] { get set }
}

//example2
protocol Buildable {
    var numberOfBricks: Int { get set }
    var materials: [String] { get set }
}
//It's not possible to create set-only properties in Swift.
protocol Singable {
    var lyrics: [String] { get set }
    var notes: [String] { get set }
}

//example3
protocol Purchaseable {
    var price: Double { get set }
    var currency: String { get set }
}
