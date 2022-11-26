//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ceren Güneş on 25.11.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
