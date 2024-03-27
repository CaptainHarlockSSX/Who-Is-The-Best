//
//  CounterHistory.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation

struct CounterHistory: Identifiable, Codable {
	let id: UUID
	let date: Date
	var score: Dictionary<UUID, Int>
	
	init(id: UUID = UUID(), date: Date, score: Dictionary<UUID, Int> = [:]) {
		self.id = id
		self.date = date
		self.score = score
	}
}
