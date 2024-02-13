//
//  ContentView.swift
//  HabitTracker
//
//  Created by Ceren Güneş on 13.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var habits = [String]()
    @State private var newHabit = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Add new habit")) {
                        TextField("e.g. Go to gym", text: $newHabit)
                        Button(action: addHabit) {
                            Text("Add")
                        }
                    }
                    
                    List {
                        ForEach(habits, id: \.self) { habit in
                            Text(habit)
                        }
                        .onDelete(perform: { indexSet in
                            deleteHabit(at: indexSet)
                        })
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Habit Tracker")
        }
    }
    
    func addHabit() {
        habits.append(newHabit)
        newHabit = ""
    }
    
    func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
