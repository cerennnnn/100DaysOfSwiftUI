//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ceren Güneş on 3.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        let binding = Binding(
            get: { selection },
            set: { selection = $0}
        )
        
        return VStack {
            Picker("Select a number", selection: $selection) {
                ForEach(0..<3) {
                    Text("Item \($0)")
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
