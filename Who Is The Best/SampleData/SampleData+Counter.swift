//
//  SampleData+Counter.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 25/03/2024.
//

import Foundation

extension User {
	static let sampleUsers: [User] = [fabien, camille, nathan, alexis]
	
	static let fabien = User(name: "Fabien")
	static let nathan = User(name: "Nathan")
	static let camille = User(name: "Camille")
	static let alexis = User(name: "Alexis")
}

extension Counter {
	static let pushUps = Counter(name: "Push ups",
								 type: .solo)
	
	static let mindBug = Counter(name: "Mind Bug",
								 type: .duo, 
								 score: [User.sampleUsers[2].id: 4,
													 User.sampleUsers[1].id: 2],
								 history: [CounterHistory(date: Date.init(timeIntervalSinceNow: -300),
														  score: [User.sampleUsers[2].id: 3,
																  User.sampleUsers[1].id: 2]),
										   CounterHistory(date: Date.init(timeIntervalSinceNow: -600),
																	score: [User.sampleUsers[2].id: 3,
																			User.sampleUsers[1].id: 1]),
										   CounterHistory(date: Date.init(timeIntervalSinceNow: -1000),
																	score: [User.sampleUsers[2].id: 3,
																			User.sampleUsers[1].id: 0])
								 ])
	
	static let notAlone = Counter(name: "Not Alone",
								  type: .circle, 
								  score: [User.sampleUsers[2].id: 2,
														 User.sampleUsers[1].id: 5,
														 User.sampleUsers[0].id: 3],
								  history: [CounterHistory(date: Date.init(timeIntervalSinceNow: -400),
														   score: [User.sampleUsers[2].id: 2,
																   User.sampleUsers[1].id: 4,
																   User.sampleUsers[0].id: 3]),
											CounterHistory(date: Date.init(timeIntervalSinceNow: -640),
																	 score: [User.sampleUsers[2].id: 1,
																			 User.sampleUsers[1].id: 4,
																			 User.sampleUsers[0].id: 3]),
											CounterHistory(date: Date.init(timeIntervalSinceNow: -990),
																	 score: [User.sampleUsers[2].id: 1,
																			 User.sampleUsers[1].id: 4,
																			 User.sampleUsers[0].id: 2])
								  ])
	
	static let bossMonster = Counter(name: "Boss Monster",
									 type: .list, 
									 score: [User.sampleUsers[3].id: 3,
														  User.sampleUsers[2].id: 2,
														  User.sampleUsers[1].id: 5,
														  User.sampleUsers[0].id: 3],
									 history: [])
}