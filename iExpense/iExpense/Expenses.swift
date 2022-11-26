//
//  Expenses.swift
//  iExpense
//
//  Created by Ceren Güneş on 25.11.2022.
//

import Foundation

class Expenses: ObservableObject {
//    stores all the expense item structs have been created
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
//        1 alttaki kod Items key'ini kullanarak UserDefaults'daki datayi okur
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                sthsth.self demek onu tip olarak belirtiyorum demek
                items = decodedItems
                return
            }
        }
        items = []
    }
}
