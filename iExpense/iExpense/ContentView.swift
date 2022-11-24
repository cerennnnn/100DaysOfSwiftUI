//
//  ContentView.swift
//  iExpense
//
//  Created by Ceren Güneş on 22.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack {
            List {
                ForEach(numbers, id: \.self) {
                    Text("Row: \($0)")
                }
                .onDelete(perform: removeRows)
            }
            Button("Add number") {
                numbers.append(currentNumber)
                currentNumber += 1
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
