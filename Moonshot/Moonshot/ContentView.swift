//
//  ContentView.swift
//  Moonshot
//
//  Created by Ceren Güneş on 5.02.2024.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let adress: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 80, maximum: 120))
        ]
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
        
        //JSON
        /*
        Button("Decode JSON") {
            let input = """
{
"name": "Taylor Swift",
"adress": {
    "street": "555, Taylor Swift Avenue",
    "city": "Nashville"
    }
}
"""
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.adress.street)
            }
        }
         
         */
        
        //Fitting Image
        /*
        Image("forest")
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
         */
        
        //Scroll View
        /*
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(0..<25) {
                    CustomText(text: "Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
         */
        
        //Navigating to another view
        /*
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                Text("This is the label")
                Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
            
                .navigationTitle("SwiftUI")
        }
         */
        
        /*
        NavigationStack {
            List(0..<25) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
         */
    }
}

#Preview {
    ContentView()
}
