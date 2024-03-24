//
//  Who_Is_The_BestApp.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 21/03/2024.
//

import SwiftUI
import SwiftData

@main
struct Who_Is_The_BestApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            CountersView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
