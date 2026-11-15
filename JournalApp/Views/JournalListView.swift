//
//  JournalListView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 12/11/2026.
//

import SwiftUI
struct JournalListView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            EmptyStateView()
                .navigationTitle("Journal")
                .toolbarTitleDisplayMode(.inlineLarge)
                .toolbar{
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button{ } label: {
                            Image(systemName:"line.3.horizontal.decrease")
                        }
                        Button{ } label: {
                            Image(systemName:"plus")
                        }
                    }
                }
                .searchable(text: $searchText)
        }
    }
}
#Preview {
        JournalListView()
            .preferredColorScheme(.dark)
    }
