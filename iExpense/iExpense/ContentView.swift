//
//  ContentView.swift
//  iExpense
//
//  Created by Ceren Güneş on 2.02.2024.
//

import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        
        Button {
            dismiss()
        } label: {
            Text("Dismiss")
        }
    }
}

struct ContentView: View {
    @State private var user = User()
    @State private var showingSheet = false
    @State private var tapCount = 0 
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet, content: {
                SecondView(name: "Ceren")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
