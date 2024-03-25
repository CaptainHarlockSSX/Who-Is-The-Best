//
//  Counter.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation

struct Counter {
	let id: UUID
	var name: String
	var score: Dictionary<UUID, Int>
	var type: CounterType
	var history: [CounterHistory]
	
	init(id: UUID = UUID(), name: String, score: Dictionary<UUID, Int>, type: CounterType, history: [CounterHistory]) {
		self.id = id
		self.name = name
		self.score = score
		self.type = type
		self.history = history
	}
}
