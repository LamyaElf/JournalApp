//
//  Models.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 10/11/2026.
//

import Foundation

struct JournalEntry: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date
    var isBookmarked: Bool
}
