//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ceren Güneş on 20.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .titleStyle()
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.blue)
            .font(.largeTitle.weight(.bold))
    }
}

#Preview {
    ContentView()
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
