//
//  CreateParticipantView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 07/04/2024.
//

import SwiftUI
import SwiftData

struct ParticipantEditorView: View {
	let searchString: String?
	let participant: User?
	
	init(searchString: String? = nil, participant: User? = nil) {
		self.searchString = searchString
		self.participant = participant
	}
	
	private var editorTitle: String {
		participant == nil ? "Create Participant" : "Edit Participant"
	}
	
	@State private var username: String = ""
	@Environment(\.dismiss) private var dismiss
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		NavigationStack {
			Form {
				TextField("Username", text: $username)
			}
			.toolbar {
				ToolbarItem(placement: .principal) {
					Text(editorTitle)
				}
				
				ToolbarItem(placement: .cancellationAction) {
					Button("Dismiss") {
						dismiss()
					}
				}
				
				ToolbarItem(placement: .confirmationAction) {
					Button("Save") {
						withAnimation {
							save()
							dismiss()
						}
					}
					.disabled(username.isEmpty)
				}
			}
			.onAppear {
				if let participant {
					username = participant.username
				}
				if let searchString {
					username = searchString
				}
			}
		}
	
	}
	
	private func save() {
		if let participant {
			// Edit the participant
			participant.username = username
		} else {
			// Create a new participant
			let newParticipant = User(username: username)
			modelContext.insert(newParticipant)
		}
	}
}

#Preview("Edit Participant") {
	ModelContainerPreview(ModelContainer.sample) {
		ParticipantEditorView(participant: User.alexis)
	}
}

#Preview("No Participants") {
	ParticipantEditorView(participant: nil)
}
