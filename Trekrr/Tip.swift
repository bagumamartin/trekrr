//
//  Tip.swift
//  Trekrr
//
//  Created by Martin on 2024. 10. 19..
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}
