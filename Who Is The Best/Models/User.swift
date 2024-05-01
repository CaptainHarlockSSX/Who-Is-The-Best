//
//  User.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation
import SwiftData

@Model
final class User {
	@Attribute(.unique) var username: String
	var counters: [Counter]?
	
	init(username: String, counters: [Counter]? = nil) {
		self.username = username
		self.counters = counters
	}
	
	func addCounter(counter: Counter) -> Void {
		counters == nil ? counters = [counter] : counters!.append(counter)
	}
	
	func removeCounter(atOffset indexSet: IndexSet) -> Void {
		guard counters != nil else {
			fatalError("User \(self.username) has no counters registered. Failed to delete counter.")
		}
		if counters!.count == 1 {
			counters = nil
		} else {
			counters!.remove(atOffsets: indexSet)
		}
	}
}
