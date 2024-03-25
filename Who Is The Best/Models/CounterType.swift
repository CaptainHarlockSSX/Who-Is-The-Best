//
//  CounterType.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation

enum CounterType: String, Identifiable {
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
