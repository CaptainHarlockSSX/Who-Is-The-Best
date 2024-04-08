//
//  MainView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 08/04/2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
		TabView {
			CountersView()
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
	MainView()
}

#Preview("Sample Data") {
	ModelContainerPreview(ModelContainer.sample) {
		MainView()
	}
}
