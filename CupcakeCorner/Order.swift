//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ceren Güneş on 16.02.2024.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            extraFrosting = false
            addSprinkles = false 
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
