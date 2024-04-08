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
	var counters = [Counter]()
	
	init(username: String) {
		self.username = username
	}
}
