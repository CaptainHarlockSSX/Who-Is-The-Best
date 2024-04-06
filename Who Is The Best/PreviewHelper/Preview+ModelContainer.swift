//
//  PreviewModelContainer.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 05/04/2024.
//

import Foundation
import SwiftData


extension ModelContainer {
	static var sample: () throws -> ModelContainer = {
		let schema = Schema([Counter.self, User.self])
		let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
		let container = try ModelContainer(for: schema, configurations: [configuration])
		Task { @MainActor in
			for user in User.sampleUsers {
				container.mainContext.insert(user)
			}
			
			for counter in Counter.sampleCounters {
				container.mainContext.insert(counter)
			}
		}
		return container
	}
}
