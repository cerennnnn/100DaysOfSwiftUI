//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Ceren Güneş on 2.02.2024.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
