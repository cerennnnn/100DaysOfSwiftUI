//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Ceren Güneş on 14.02.2024.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var description = ""
    @State private var category = "Personal"
    
    var habits: Habits
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("e.g Working out for 15 mins.", text: $description)
                
                Picker("Type", selection: $category) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let newHabit = Habit(category: category, description: description)
                    habits.habits.append(newHabit)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddHabitView(habits: Habits())
}
