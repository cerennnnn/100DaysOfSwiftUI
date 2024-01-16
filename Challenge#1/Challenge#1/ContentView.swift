//
//  ContentView.swift
//  Challenge#1
//
//  Created by Ceren Güneş on 16.01.2024.
//

import SwiftUI

struct ContentView: View {
    let units = ["hour", "minutes", "seconds"]
    @State private var selectFrom = "hour"
    @State private var selectTo = "hour"
    @State private var unit = 0.0
    
    var convertedUnit: Double {
        var convertedNumber = unit
        
        switch (selectFrom, selectTo) {
        case ("hour", "minutes"):
            convertedNumber *= 60
        case ("minutes", "hour"):
            convertedNumber /= 60
        case ("hour", "seconds"):
            convertedNumber *= 3600
        case ("seconds", "hour"):
            convertedNumber /= 3600
        case ("minutes", "seconds"):
            convertedNumber *= 60
        case ("seconds", "minutes"):
            convertedNumber /= 60
        default:
            break
        }
        
        return convertedNumber
    }

    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter a number you want to convert") {
                    TextField("Enter a number you want to convert", value: $unit, format: .number)
                }
                
                Section("Select a unit to convert from") {
                    Picker("Units", selection: $selectFrom) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Select a unit to convert to") {
                    Picker("Units", selection: $selectTo) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(convertedUnit, format: .number)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
