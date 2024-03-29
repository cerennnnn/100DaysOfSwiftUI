//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ceren Güneş on 23.02.2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
