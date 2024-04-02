//
//  CountersView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 24/03/2024.
//

import SwiftUI
import SwiftData

struct CountersView: View {
	@Environment(\.modelContext) private var modelContext
	@Query(sort: \Counter.name) private var counterList: [Counter]
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(counterList) { counter in
					NavigationLink(destination: {}) {
						CounterCardView(counter: counter)
					}
				}
				.onDelete(perform: deleteCounter)
			}
			.overlay {
				if counterList.isEmpty {
					ContentUnavailableView {
						Label("No Counters registered.", systemImage: "folder.badge.questionmark")
					} description: {
						
					}
				}
			}
			.navigationTitle("Counters")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					NavigationLink(destination: CounterEditorView(counter: nil)) {
						Image(systemName: "plus")
					}
				}
			}

		}
    }
	
	func deleteCounter(_ indexSet: IndexSet) {
		for index in indexSet {
			let counter = counterList[index]
			modelContext.delete(counter)
		}
	}
}

#Preview("Counter List") {
	do {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		let container = try ModelContainer(for: Counter.self, configurations: config)
		
		container.mainContext.insert(Counter.mindBug)
		container.mainContext.insert(Counter.notAlone)
		container.mainContext.insert(Counter.bossMonster)
		container.mainContext.insert(Counter.pushUps)
		
		return CountersView()
			.modelContainer(container)
	} catch {
		fatalError("Failed to create sample model container.")
	}
}

#Preview("No Counter") {
	do {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		let container = try ModelContainer(for: Counter.self, configurations: config)
		
		return CountersView()
			.modelContainer(container)
	} catch {
		fatalError("Failed to create sample model container.")
	}
}
