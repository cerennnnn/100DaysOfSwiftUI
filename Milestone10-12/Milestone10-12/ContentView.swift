//
//  ContentView.swift
//  Milestone10-12
//
//  Created by Ceren Güneş on 26.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink(destination: UserDetailsView(user: user, allUsers: self.users)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text("Active: \(user.isActive ? "Yes" : "No")")
                            .font(.subheadline)
                            .foregroundColor(user.isActive ? .green : .red)
                    }
                }
            }
            .navigationBarTitle("Users")
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard users.isEmpty else { return }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.users = decodedData
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct UserDetailsView: View {
    let user: User
    let allUsers: [User]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(user.name)")
                .font(.title)
            Text("Age: \(user.age)")
            Text("Company: \(user.company)")
            Text("Email: \(user.email)")
            Text("Registered: \(user.registered)")
            
            Text("Friends:")
                .font(.headline)
            
            ForEach(user.friends, id: \.id) { friend in
                if let friendUser = self.allUsers.first(where: { $0.id == friend.id }) {
                    Text("- \(friendUser.name)")
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(user.name), displayMode: .inline)
    }
}

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let age: Int
    let company: String
    let email: String
    let registered: String
    let isActive: Bool
    let friends: [Friend]
}

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
