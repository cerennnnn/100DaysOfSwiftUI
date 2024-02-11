//
//  ContentView.swift
//  Navigation
//
//  Created by Ceren Güneş on 9.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
           Text("Hello, World!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ContentView()
}
