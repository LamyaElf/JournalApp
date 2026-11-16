//
//  JournalCardView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 16/11/2026.
//

import SwiftUI

struct JournalCardView: View {
    let entry: JournalEntry
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            
            HStack {
                Text(entry.title)
                    .font(.titleCard)
                    .foregroundStyle(.textAccent)
                Spacer()
                Button {
                    viewModel.toggleBookmark(for: entry)
                } label: {
                    Image(systemName: entry.isBookmarked ? "bookmark.fill" : "bookmark")
                        .font(.title2)
                        .foregroundStyle(.textAccent)
                }
                .buttonStyle(.plain)
            }
            Text(entry.date.formatted(date: .numeric, time: .omitted))
                .font(.captionS)
                .foregroundStyle(.textSecondary)
            Text(entry.content)
                .font(.bodyM)
                .foregroundStyle(.textPrimary)
                .lineLimit(5)
                .padding(.top, 12)
        }
        .padding(20)
        .background(.surfaceCard)
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}
#Preview {
    JournalCardView(entry: JournalEntry(title: "My Birthday", content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh viverra non semper suscipit posuere a pede.", date: Date(), isBookmarked: true), viewModel: JournalViewModel())
        .preferredColorScheme(.dark)
}
