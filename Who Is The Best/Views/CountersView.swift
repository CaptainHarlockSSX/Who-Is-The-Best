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
	ModelContainerPreview(ModelContainer.sample) {
		CountersView()
	}
}

#Preview("No Counter") {
	CountersView()
}
