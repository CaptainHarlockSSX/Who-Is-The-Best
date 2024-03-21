//
//  Item.swift
//  Who Is The Best
//
//  Created by Nathan Rassié on 21/03/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
