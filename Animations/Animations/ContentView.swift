//
//  ContentView.swift
//  Animations
//
//  Created by Ceren Güneş on 13.11.2022.
//

import SwiftUI

struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String
}

struct ContentView: View {
    @State private var character = [Character]()
    
    var body: some View {
        NavigationView {
            List(character, id: \.id) { person in
                VStack(alignment: .leading) {
                    Text(person.type)
                        .font(.headline)
                        .foregroundColor(Color("skyBlue"))
                    Text(person.name)
                        .font(.body)
                }
            }
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
//        create URL
        guard let url  = URL(string: "https://rickandmortyapi.com/api/character/{id}") else {
            print("Error")
            return
        }
        
//        fetch data from that url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
        
//        decode that data
            if let decodedResponse = try? JSONDecoder().decode([Character].self, from: data) {
            character = decodedResponse
        }
    } catch {
        print("This data is not valid!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
