//
//  AddParticipantView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 31/03/2024.
//

import SwiftUI
import SwiftData

struct AddParticipantView: View {
	@State private var searchString = ""
	@Query(sort: \User.username) private var globalParticipants: [User]
	@Environment(\.modelContext) private var modelContext
	@Binding var isPresentingParticipantEditorSheet: Bool
	@Binding var isPresentingParticipantListSheet: Bool
	@Binding var counterParticipants: [User]
	
	var filteredParticipants: [User] {
		if searchString.isEmpty {
			globalParticipants
		} else {
			globalParticipants.filter { $0.username.localizedStandardContains(searchString) }
		}
	}
	
    var body: some View {
		NavigationStack {
			VStack {
				if(filteredParticipants.isEmpty) {
					Label("Participant Not Found", systemImage: "person.slash")
						.font(.callout)
					
					Button(action: {
						isPresentingParticipantEditorSheet = true
					}, label: {
						Text("Create Participant")
					})
					.padding(.top)
				}
				
				List(filteredParticipants, id: \.self) { user in
					Text(user.username)
						.onTapGesture(perform: {
							counterParticipants.append(user)
							isPresentingParticipantListSheet.toggle()
						})
				}
				
			}
			.sheet(isPresented: $isPresentingParticipantEditorSheet, content: {
				ParticipantEditorView(participant: nil, isPresentingParticipantEditorSheet: $isPresentingParticipantEditorSheet)
					.presentationDetents([.fraction(0.9)])
					.presentationCornerRadius(30)
					.presentationBackground(.thickMaterial)
			})
			.searchable(text: $searchString, prompt: "Username...")
			.navigationTitle("Search Participant")
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Dismiss") {
						isPresentingParticipantListSheet.toggle()
					}
				}
			}
		}
		
    }
}

#Preview("Existing Participants") {
	ModelContainerPreview(ModelContainer.sample) {
		AddParticipantView(isPresentingParticipantEditorSheet: .constant(false), isPresentingParticipantListSheet: .constant(true), counterParticipants: .constant(User.sampleUsers))
	}
}

#Preview("No Participants") {
	AddParticipantView(isPresentingParticipantEditorSheet: .constant(false), isPresentingParticipantListSheet: .constant(true), counterParticipants: .constant([]))
}
