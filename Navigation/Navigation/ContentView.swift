//
//  ContentView.swift
//  Navigation
//
//  Created by Ceren Güneş on 9.02.2024.
//

import SwiftUI

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationLink("Tap Me") {
                DetailView(number: 50)
            }
    }
}

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

#Preview {
    ContentView()
}
