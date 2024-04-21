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
	
	let modelContainer: ModelContainer
	
	init() {
		do {
			let schema = Schema([Counter.self, User.self])
			modelContainer = try ModelContainer(for: schema)
		} catch {
			fatalError("Could not initialize ModelContainer")
		}
	}
	
    var body: some Scene {
        WindowGroup {
            AppTabView()
        }
		.modelContainer(modelContainer)
    }
}
