//
//  CounterEditorView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 27/03/2024.
//

import SwiftUI
import SwiftData

struct CounterEditorView: View {
	let counter: Counter?
	
	private var editorTitle: String {
		counter == nil ? "Add Counter" : "Edit Counter"
	}
	
	@State private var counterName = ""
	@State private var counterType = Counter.CounterType.solo
	@State private var counterParticipants: [User] = []
	@State private var newParticipantUsername = ""
	@State private var isPresentingParticipantSheet = false
	
	@Environment(\.modelContext) private var modelContext
	@Environment(\.dismiss) private var dismiss

	var saveDisableCondition: Bool {
		(counterName.isEmpty) ||
		(counterType == Counter.CounterType.solo && counterParticipants.count != 0) ||
		(counterType == Counter.CounterType.duo && counterParticipants.count != 2) ||
		(counterType == Counter.CounterType.list && counterParticipants.count < 2) ||
		(counterType == Counter.CounterType.circle && counterParticipants.count < 2)
	}
	
    var body: some View {
		NavigationStack {
			Form {
				Section(header: Text("Counter Info")) {
					TextField("My Counter Name", text: $counterName)
					
					Picker("Type", selection: $counterType) {
						ForEach(Counter.CounterType.allCases) { type in
							Text(type.name).tag(type)
						}
					}
				}
				
				Section(header: Text("Participants")) {
					ForEach(counterParticipants) { participant in
						Label(participant.username, systemImage: "person")
					}
					.onDelete(perform: { indexSet in
						counterParticipants.remove(atOffsets: indexSet)
					})
					
					Button(action: {
						isPresentingParticipantSheet = true
					}, label: {
						withAnimation {
							Label("Add Participant", systemImage: "plus.circle.fill")
						}
					})
						
				}
			}
			.sheet(isPresented: $isPresentingParticipantSheet, content: {
				AddParticipantView(isPresentingParticipantListSheet: $isPresentingParticipantSheet, counterParticipants: $counterParticipants)
			})
			.toolbar {
				ToolbarItem(placement: .principal) {
					Text(editorTitle)
				}
				
				ToolbarItem(placement: .confirmationAction) {
					Button("Save") {
						withAnimation {
							save()
							dismiss()
						}
					}
					.disabled(saveDisableCondition)
				}
				
			}
			.onAppear {
				if let counter {
					// Edit an existing Counter
					counterName = counter.name
					counterType = counter.type
					counterParticipants = counter.counterParticipants
				}
			}
		}
    }
	
	private func save() {
		if let counter {
			// Edit the counter
			counter.name = counterName
			counter.type = counterType
			counter.counterParticipants = counterParticipants
		} else {
			// Add a new counter
			let newCounter = Counter(name: counterName, type: counterType, counterParticipants: counterParticipants)
			modelContext.insert(newCounter)
		}
	}
	
}

#Preview("Add Counter") {
	ModelContainerPreview(ModelContainer.sample) {
		CounterEditorView(counter: nil)
	}
}

#Preview("Edit Counter") {
	ModelContainerPreview(ModelContainer.sample) {
		CounterEditorView(counter: Counter.mindBug)
	}
}
