import UIKit

//extensions

var quote = "    The truth is rarely pure and never simple.    "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(quote)
print(trimmed)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let trimmed1 = quote.trimmed()

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}
let trimmed2 = trim(quote)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int

//    init(title: String, pageCount: Int) {
//        self.title = title
//        self.pageCount = pageCount
//        self.readingHours = pageCount / 50
//    }
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

extension String {
    mutating func append(_ other: String) {
        self += other
    }
}

extension Int {
    func times(_ action: () -> Void) {
        for _ in 0..<self {
            action()
        }
    }
}

extension Array {
    func summarize() {
        print("The array has \(count) items. They are:")
        for item in self {
            print(item)
        }
    }
}

extension Int {
    var isAnswerToLifeUniverseAndEverything: Bool {
        let target = 42
        return self == target
    }
}

extension Bool {
    func toggled() -> Bool {
        if self == true {
            return false
        } else {
            return true
        }
    }
}

extension Int {
    func cubed() -> Int {
        return self * self * self
    }
}

extension Int {
    func clamped(min: Int, max: Int) -> Int {
        if (self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}

extension String {
    var isLong: Bool {
        return count > 25
    }
}

extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}

extension String {
    func isUppercased() -> Bool {
        return self == self.uppercased()
    }
}


protocol Building {
    var roomNumber: Int { get }
    var cost: Int { get }
    var name: String { get}
    
    func salesSummary()
}

struct House: Building {
    var roomNumber: Int = 4
    var cost: Int = 1000
    var name: String = "Penthouse"
    
    func salesSummary() {
        print("\(name) has \(roomNumber) rooms and costs \(cost)$s. ")
    }
}
var house = House()
house.salesSummary()

struct Office: Building {
    var roomNumber: Int = 50
    var cost: Int = 10_000
    var name: String = "Dunder Mifflin Scranton"
    
    func salesSummary() {
        print("\(name) has \(roomNumber) rooms and costs \(cost)$s.")
    }
}

var office = Office()
office.salesSummary()
