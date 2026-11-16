//
//  JournalListView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 12/11/2026.
//

import SwiftUI
struct JournalListView: View {
    @State private var searchText = ""
    @State private var showEditor = false
    @StateObject private var viewModel = JournalViewModel()
    var body: some View {
        NavigationStack{
            Group {
                if viewModel.entries.isEmpty {
                    EmptyStateView()
                } else {
                    List (viewModel.displayedEntries) { entry in
                        JournalCardView(entry: entry, viewModel: viewModel)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 6, leading:20, bottom:6, trailing:20 ))
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Journal")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Menu{
                        Button("Sort by Bookmark"){viewModel.sortOption = .bookmark }
                        Divider()
                        Button("Sort by Entry Date"){ viewModel.sortOption = .date }
                    } label: {
                        Image(systemName:"line.3.horizontal.decrease")
                    }
                    Button{ showEditor = true
                    } label: {
                        Image(systemName:"plus")
                    }
                }
            }
            .searchable(text: $searchText)
            .sheet(isPresented: $showEditor) {
                JournalEditorView(viewModel: viewModel)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}
#Preview {
    JournalListView()
        .preferredColorScheme(.dark)
}
