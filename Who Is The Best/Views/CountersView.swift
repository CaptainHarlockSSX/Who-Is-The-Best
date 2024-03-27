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
			List(counterList) { counter in
				NavigationLink(destination: {}) {
					CounterCardView()
				}
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
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
					Image(systemName: "plus")
				})
			}
		}
    }
}

#Preview {
	CountersView()
}
