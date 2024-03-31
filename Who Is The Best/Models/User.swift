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
	@Attribute(.unique) let username: String
	
	init(username: String) {
		self.username = username
	}
}
