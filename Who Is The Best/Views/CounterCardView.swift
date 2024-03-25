//
//  CounterCardView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 24/03/2024.
//

import SwiftUI

struct CounterCardView: View {
    var body: some View {
		HStack {
			Image(systemName: "camera")
				.padding(.horizontal)
			
			VStack(alignment: .leading) {
				Text("Counter Name")
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
    CounterCardView()
}
