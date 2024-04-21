//
//  AppTabView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 08/04/2024.
//

import SwiftUI
import SwiftData

struct AppTabView: View {
	@State private var isPresentingParticipantEditorSheet: Bool = false
	
    var body: some View {
		TabView {
			CountersView(isPresentingParticipantEditorSheet: $isPresentingParticipantEditorSheet)
				.tabItem {
					Label(
						title: { Text("Counters") },
						icon: { Image(systemName: "gauge") }
					)
				}
			UserListView()
				.tabItem {
					Label(
						title: { Text("Participants") },
						icon: { Image(systemName: "person.3.fill") }
					)
				}
		}
    }
}
#Preview("Empty App") {
	AppTabView()
}

#Preview("Sample Data") {
	ModelContainerPreview(ModelContainer.sample) {
		AppTabView()
	}
}
