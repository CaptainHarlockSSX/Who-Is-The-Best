//
//  CountersView.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 24/03/2024.
//

import SwiftUI

struct CountersView: View {
    var body: some View {
		NavigationStack {
			List() {
				NavigationLink(destination: {}) { CounterCardView()
				}
				NavigationLink(destination: {}) { CounterCardView()
				}
				NavigationLink(destination: {}) { CounterCardView()
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
