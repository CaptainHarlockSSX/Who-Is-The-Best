//
//  CounterCardView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 24/03/2024.
//

import SwiftUI
import SwiftData

struct CounterCardView: View {
	@Bindable var counter: Counter
	
    var body: some View {
		HStack {
			Image(systemName: "camera")
				.padding(.horizontal)
			
			VStack(alignment: .leading) {
				Text(counter.name)
					.font(.headline)
					.accessibilityAddTraits(.isHeader)
				Text("Leader : Antoine")
					.font(.subheadline)
					.accessibilityAddTraits(.isStaticText)
				Spacer()
				Text("This is a description of this Counter.")
					.font(.caption)
					.italic()
			}
			.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			
		}
    }
}

#Preview {
	do {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		let container = try ModelContainer(for: Counter.self, configurations: config)
		return CounterCardView(counter: Counter.bossMonster)
			.modelContainer(container)
	} catch {
		fatalError("Failed to create sample model container.")
	}
}
