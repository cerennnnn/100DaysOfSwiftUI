//
//  ContentView.swift
//  BetterRest
//
//  Created by Ceren Güneş on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        }
            .padding()
    }
    
    func exampleDates() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
        
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
    }
}

#Preview {
    ContentView()
}
