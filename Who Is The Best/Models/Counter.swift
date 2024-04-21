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
	var score: Dictionary<String, Int>
	@Relationship(deleteRule: .noAction, inverse: \User.counters) var counterParticipants = [User]()
	var type: AppCounterType
	var history: [CounterHistory]
	
	init(id: UUID = UUID(), name: String, type: AppCounterType, score: Dictionary<String, Int> = [:], history: [CounterHistory] = [], counterParticipants: [User] = []) {
		self.id = id
		self.name = name
		self.score = score
		self.type = type
		self.history = history
		self.counterParticipants = counterParticipants
	}
}
