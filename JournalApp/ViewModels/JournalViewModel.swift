//
//  ViewModels.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 10/11/2026.
//

import Foundation
import Combine
enum SortOption {
    case date
    case bookmark
}

class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []
    @Published var sortOption: SortOption = .date
    var displayedEntries: [JournalEntry] {
        switch sortOption {
        case .bookmark:
            return entries.filter { $0.isBookmarked }
        case .date:
            return entries.sorted { $0.date > $1.date }
        }
    }
    
    func addEntry(title: String, content: String){
        let newEntry = JournalEntry(title: title, content: content, date: Date(), isBookmarked: false)
        entries.append(newEntry)}
    
    func toggleBookmark(for entry: JournalEntry) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].isBookmarked.toggle()
        }
    }
    func deleteEntry(_ entry: JournalEntry) {
        entries.removeAll { $0.id == entry.id }
    }
    func updateEntry(_ entry: JournalEntry, title: String, content: String) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].title = title
            entries[index].content = content
            
            
        }
    }
        
    }
