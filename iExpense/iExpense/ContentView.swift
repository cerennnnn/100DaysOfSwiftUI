//
//  ContentView.swift
//  iExpense
//
//  Created by Ceren Güneş on 2.02.2024.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID() //Identifiable protocol requirement
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var itemTitle = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(item.amount > 500 ? .red : item.amount > 100 ? .black : .green)
                            .fontWeight(item.amount > 500 ? .bold : .semibold)
                            .font(.system(size: item.amount > 500 ? 15 : 17))
                    }
                }
                .onDelete(perform: { indexSet in
                    removeItems(at: indexSet)

                })
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink("Add Expense") {
                    AddView(expenses: expenses)
                }

            }
            .navigationTitle($itemTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func removeItems(at offests: IndexSet) {
        expenses.items.remove(atOffsets: offests)
    }
}

#Preview {
    ContentView()
}
