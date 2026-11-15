//
//  ViewModels.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 10/11/2026.
//

import Foundation
import Combine

class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []
    
    func addEntry(title: String, content: String){
        let newEntry = JournalEntry(title: title, content: content, date: Date(), isBookmarked: false)
        entries.append(newEntry)
    }
}
