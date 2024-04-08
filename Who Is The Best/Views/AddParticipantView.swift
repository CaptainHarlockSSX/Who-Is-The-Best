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
				List(filteredParticipants, id: \.self) { user in
					Text(user.username)
						.onTapGesture(perform: {
							counterParticipants.append(user)
							isPresentingParticipantListSheet = false
						})
				}
				
				Button(action: {
					modelContext.insert(User(username: searchString))
					searchString = ""
				}, label: {
					Text("Create Participant")
				})
				.padding()
				.disabled(!globalParticipants.isEmpty && !filteredParticipants.isEmpty)
			}
			
			.searchable(text: $searchString, prompt: "Username...")
			.navigationTitle("Search Participant")
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Dismiss") {
						isPresentingParticipantListSheet = false
					}
				}
			}
		}
		
    }
}

#Preview("Existing Participants") {
	ModelContainerPreview(ModelContainer.sample) {
		AddParticipantView(isPresentingParticipantListSheet: .constant(true), counterParticipants: .constant(User.sampleUsers))
	}
}

#Preview("No Participants") {
	AddParticipantView(isPresentingParticipantListSheet: .constant(true), counterParticipants: .constant([]))
}
