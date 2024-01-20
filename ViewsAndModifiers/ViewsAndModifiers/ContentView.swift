//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ceren Güneş on 20.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Color.blue
                .frame(width: 300, height: 200)
                .watermark(with: "Hacking With Swift")
        }
    }
}


#Preview {
    ContentView()
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing, content: {
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        })
    }
}

extension View {
    func watermark(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
