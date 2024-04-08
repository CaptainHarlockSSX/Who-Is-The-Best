//
//  CreateParticipantView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 07/04/2024.
//

import SwiftUI
import SwiftData

struct ParticipantEditorView: View {
	let participant: User?
	
	private var editorTitle: String {
		participant == nil ? "Create Participant" : "Edit Participant"
	}
	
	@State private var username: String = ""
	@Binding var isPresentingParticipantListSheet: Bool
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
						isPresentingParticipantListSheet = false
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
		ParticipantEditorView(participant: User.alexis, isPresentingParticipantListSheet: .constant(true))
	}
}

#Preview("No Participants") {
	ParticipantEditorView(participant: nil, isPresentingParticipantListSheet: .constant(true))
}
