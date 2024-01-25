//
//  ContentView.swift
//  BetterRest
//
//  Created by Ceren Güneş on 23.01.2024.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    let coffeeRange = 1...20
    @State private var wakeUp = ContentView.defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var recommendedBedtime = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
                    Picker("Coffee Amount", selection: $coffeeAmount) {
                        ForEach(coffeeRange, id: \.self) {
                            Text("\($0) \($0 == 1 ? "cup" : "cups")")
                        }
                    }
                }
                
                Section("Recommended bedtime:") {
                    Text(recommendedBedtime)
                        .font(.largeTitle)
                }
            }
            .onChange(of: wakeUp, { _, _ in
                calculateBedTime()
            })
            .onChange(of: sleepAmount, { _, _ in
                calculateBedTime()
            })
            .onChange(of: coffeeAmount, { _, _ in
                calculateBedTime()
            })
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            let sleepTime = wakeUp - prediction.actualSleep
            
            recommendedBedtime = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            print("error")
        }
    }
}

#Preview {
    ContentView()
}
