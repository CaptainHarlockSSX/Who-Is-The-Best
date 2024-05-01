//
//  AppCounterScreen.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 21/04/2024.
//

import SwiftUI

enum AppCounterType: String, Identifiable, CaseIterable, Codable {
	case solo
	case duo
	case circle
	case list
	
	var name: String {
		rawValue.capitalized
	}
	
	var id: String {
		name
	}
}

extension AppCounterType {
	@ViewBuilder
	var label: some View {
		switch self {
		case .solo:
			Label("Solo", systemImage: "person.fill")
		case .duo:
			Label("Duo", systemImage: "person.2.fill")
		case .circle:
			Label("Circle", systemImage: "circle.dashed")
		case .list:
			Label("List", systemImage: "list.bullet")
		}
	}
	
	@ViewBuilder
	func destination(counter: Counter) -> some View {
		switch self {
		case .solo:
			SoloCounterView()
		case .duo:
			DuoCounterView()
		case .circle:
			CircleCounterView()
		case .list:
			ListCounterView()
		}
	}
}

