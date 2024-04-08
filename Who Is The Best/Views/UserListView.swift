//
//  UserListView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 07/04/2024.
//

import SwiftUI
import SwiftData

struct UserListView: View {
	@Environment(\.modelContext) private var modelContext
	@Query(sort: \User.username) private var userList: [User]
	
	@State private var isPresentingParticipantEditorSheet: Bool = false
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(userList) { user in
					NavigationLink(destination: {}) {
						Label(user.username, systemImage: "person")
					}
				}
//				.onDelete(perform: deleteCounter)
			}
			.sheet(isPresented: $isPresentingParticipantEditorSheet, content: {
				ParticipantEditorView(participant: nil, isPresentingParticipantListSheet: $isPresentingParticipantEditorSheet)
			})
			.overlay {
				if userList.isEmpty {
					ContentUnavailableView {
						Label("No Users registered.", systemImage: "person.2.slash")
					} description: {
						AddParticipantButton(isPresentingParticipantEditorSheet: $isPresentingParticipantEditorSheet)
					}
				}
			}
			.navigationTitle("Users")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					AddParticipantButton(isPresentingParticipantEditorSheet: $isPresentingParticipantEditorSheet)
				}
			}

		}
    }
}

private struct AddParticipantButton: View {
	@Binding var isPresentingParticipantEditorSheet: Bool
	
	var body: some View {
		Button(action: {
			isPresentingParticipantEditorSheet = true
		}, label: {
			Label(
				title: { Text("Create Participant") },
				icon: { Image(systemName: "plus") }
			)
			.help("Create a Participant")
		})
	}
}

#Preview("No Users") {
    UserListView()
}

#Preview("User List") {
	ModelContainerPreview(ModelContainer.sample) {
		UserListView()
	}
}
