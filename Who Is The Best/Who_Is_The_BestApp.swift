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
    var body: some Scene {
        WindowGroup {
            CountersView()
        }
		.modelContainer(for: Counter.self)
    }
}
