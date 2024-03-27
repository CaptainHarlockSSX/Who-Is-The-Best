//
//  User.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation
import SwiftData

@Model
final class User: Identifiable {
	let id: UUID
	let name: String
	
	init(id: UUID = UUID(), name: String) {
		self.id = id
		self.name = name
	}
}
