//
//  ContentView.swift
//  Converter
//
//  Created by Ceren Güneş on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var input: Double = 1
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Kilometers"
    @FocusState private var isKeyboardEnabled: Bool
    
    let measurements = ["Feet", "Kilometers", "Meters", "Miles", "Yard"]
    
    var result: String {
        let inputToMetersMultiplier: Double
        let metersToOutputMultiplier: Double
        
        switch inputUnit {
        case "Feet":
            inputToMetersMultiplier = 0.3048
        case "Kilometers":
            inputToMetersMultiplier = 1000
        case "Miles":
            inputToMetersMultiplier = 1609.34
        case "Yards":
            inputToMetersMultiplier = 0.9144
        default:
            inputToMetersMultiplier = 1.0
        }
        
        switch outputUnit {
        case "Feet":
            metersToOutputMultiplier = 3.28084
        case "Kilometers":
            metersToOutputMultiplier = 0.001
        case "Miles":
            metersToOutputMultiplier = 0.000621371
        case "Yards":
            metersToOutputMultiplier = 1.09361
        default:
            metersToOutputMultiplier = 1.0
        }
        
        let inputInMeters = input * inputToMetersMultiplier
        let output = (inputInMeters * metersToOutputMultiplier).formatted()
        
        return "\(output) \(outputUnit.lowercased())"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isKeyboardEnabled)
                } header: {
                    Text("Amount to convert")
                }
                
                Section {
                    Picker("From:", selection: $inputUnit) {
                        ForEach(measurements, id: \.self) { type in
                            Text(type)
                        }
                    }
                    
                    Picker("To:", selection: $outputUnit) {
                        ForEach(measurements, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Result:")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isKeyboardEnabled = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
