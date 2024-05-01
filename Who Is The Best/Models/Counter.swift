//
//  Counter.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Counter: Identifiable {
	let id: UUID
	var name: String
	var caption: String?
	var score: Dictionary<String, Int>
	@Relationship(deleteRule: .nullify, inverse: \User.counters) var counterParticipants = [User]()
	var type: AppCounterType
	var history: [CounterHistory]
	@Attribute(.externalStorage) var image: Data?
	
	init(id: UUID = UUID(), name: String, caption: String? = nil, score: Dictionary<String, Int> = [:], type: AppCounterType, history: [CounterHistory] = [], image: Data? = nil) {
		self.id = id
		self.name = name
		self.caption = caption
		self.score = score
		self.type = type
		self.history = history
		self.image = image
	}
	
	func addParticipant(participant: User) -> Void {
		self.score[participant.username] = 0
		counterParticipants.append(participant)
	}
	
	func removeParticipant(withName name: String) -> Void {
		self.score.removeValue(forKey: name)
		self.counterParticipants.removeAll(where: { $0.username == name })
	}
	
	func removeParticpant(withIndex index: Int) -> Void {
		let removedUser = self.counterParticipants.remove(at: index)
		self.score.removeValue(forKey: removedUser.username)
	}
	
	func incrementScore(ofParticipant participant: User, value: Int) -> Void {
		score[participant.username]! += value
	}
}
