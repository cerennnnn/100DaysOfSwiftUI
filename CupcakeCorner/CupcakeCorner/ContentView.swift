//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ceren Güneş on 15.02.2024.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
            
        
        List(results, id: \.trackId)  { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                
                Text(item.collectionName)
            }
        }
        .task {
//            await loadData()
        }
    }
    
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            //more code here
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data.")
        }
    }
}

#Preview {
    ContentView()
}
