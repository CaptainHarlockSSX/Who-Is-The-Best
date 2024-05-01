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
	@Binding var isPresentingParticipantEditorSheet: Bool

    var body: some View {
		NavigationStack {
			List {
				ForEach(counterList) { counter in
					NavigationLink(destination: {
						counter.type.destination(counter: counter)
					}) {
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
						AddCounterButton(isPresentingParticipantEditorSheet: $isPresentingParticipantEditorSheet)
					}
				}
			}
			.navigationTitle("Counters")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					AddCounterButton(isPresentingParticipantEditorSheet: $isPresentingParticipantEditorSheet)
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

private struct AddCounterButton: View {
	@Binding var isPresentingParticipantEditorSheet: Bool

	var body: some View {
		NavigationLink(destination: CounterEditorView(counter: nil, isPresentingParticipantEditorSheet: $isPresentingParticipantEditorSheet)) {
			Label("Add a Counter", systemImage: "plus")
				.help("Add a Counter")
		}
	}
}

#Preview("Counter List") {
	ModelContainerPreview(ModelContainer.sample) {
		CountersView(isPresentingParticipantEditorSheet: .constant(false))
	}
}

#Preview("No Counter") {
	CountersView(isPresentingParticipantEditorSheet: .constant(false))
}
