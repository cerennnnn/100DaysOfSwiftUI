//
//  ContentView.swift
//  Animations
//
//  Created by Ceren Güneş on 29.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me!") {
            //do nothing
            withAnimation(.bouncy(duration: 1, extraBounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x:0, y: 1, z: 0))
    }
}

#Preview {
    ContentView()
}
