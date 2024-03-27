//
//  Counter.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation
import SwiftData

@Model
final class Counter: Identifiable {
	let id: UUID
	var name: String
	var score: Dictionary<UUID, Int>
	var type: CounterType
	var history: [CounterHistory]
	
	init(id: UUID = UUID(), name: String, type: CounterType, score: Dictionary<UUID, Int> = [:], history: [CounterHistory] = []) {
		self.id = id
		self.name = name
		self.score = score
		self.type = type
		self.history = history
	}
}

extension Counter { 
	enum CounterType: String, Identifiable, CaseIterable, Codable {
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
}
