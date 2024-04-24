//
//  SampleData+Counter.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation

extension User {
	static let sampleUsers: [User] = [fabien, camille, nathan, alexis]
	
	static let fabien = User(username: "Fabien")
	static let nathan = User(username: "Nathan")
	static let camille = User(username: "Camille")
	static let alexis = User(username: "Alexis")
}

extension Counter {
	static let sampleCounters: [Counter] = [pushUps, mindBug, notAlone, bossMonster]
	
	static let pushUps = Counter(name: "Push ups",
								 type: .solo)
	
	static let mindBug = Counter(name: "Mind Bug",
								 score: [User.sampleUsers[2].username: 4,
										 User.sampleUsers[1].username: 2], type: .duo,
								 history: [CounterHistory(date: Date.init(timeIntervalSinceNow: -300),
														  score: [User.sampleUsers[2].username: 3,
																  User.sampleUsers[1].username: 2]),
										   CounterHistory(date: Date.init(timeIntervalSinceNow: -600),
																	score: [User.sampleUsers[2].username: 3,
																			User.sampleUsers[1].username: 1]),
										   CounterHistory(date: Date.init(timeIntervalSinceNow: -1000),
																	score: [User.sampleUsers[2].username: 3,
																			User.sampleUsers[1].username: 0])
								 ])
	
	static let notAlone = Counter(name: "Not Alone",
								  score: [User.sampleUsers[2].username: 2,
										  User.sampleUsers[1].username: 5,
										  User.sampleUsers[0].username: 3], type: .circle,
								  history: [CounterHistory(date: Date.init(timeIntervalSinceNow: -400),
														   score: [User.sampleUsers[2].username: 2,
																   User.sampleUsers[1].username: 4,
																   User.sampleUsers[0].username: 3]),
											CounterHistory(date: Date.init(timeIntervalSinceNow: -640),
																	 score: [User.sampleUsers[2].username: 1,
																			 User.sampleUsers[1].username: 4,
																			 User.sampleUsers[0].username: 3]),
											CounterHistory(date: Date.init(timeIntervalSinceNow: -990),
																	 score: [User.sampleUsers[2].username: 1,
																			 User.sampleUsers[1].username: 4,
																			 User.sampleUsers[0].username: 2])
								  ])
	
	static let bossMonster = Counter(name: "Boss Monster",
									 score: [User.sampleUsers[3].username: 3,
											 User.sampleUsers[2].username: 2,
											 User.sampleUsers[1].username: 5,
											 User.sampleUsers[0].username: 3], type: .list,
									 history: [])
}
