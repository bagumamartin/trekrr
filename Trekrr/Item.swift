//
//  Item.swift
//  Trekrr
//
//  Created by Martin on 2024. 10. 19..
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
