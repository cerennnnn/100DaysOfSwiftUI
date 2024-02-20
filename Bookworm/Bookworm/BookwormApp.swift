//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ceren Güneş on 19.02.2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
