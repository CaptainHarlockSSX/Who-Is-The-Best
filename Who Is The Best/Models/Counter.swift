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
	@Relationship(deleteRule: .noAction, inverse: \User.counters) var counterParticipants = [User]()
	var type: CounterType
	var history: [CounterHistory]
	var image: Image?
	
	init(id: UUID = UUID(), name: String, caption: String? = nil, score: Dictionary<String, Int> = [:], counterParticipants: [User] = [User](), type: CounterType, history: [CounterHistory] = [], image: Image? = nil) {
		self.id = id
		self.name = name
		self.caption = caption
		self.score = score
		self.counterParticipants = counterParticipants
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
