//
//  JournalListView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 12/11/2026.
//

import SwiftUI
struct JournalListView: View {
    @State private var showEditor = false
    @State private var showDeleteAlert = false
    @State private var entryToDelete: JournalEntry?
    @State private var selectedEntry: JournalEntry?
    @StateObject private var viewModel = JournalViewModel()
    var body: some View {
        NavigationStack{
            Group {
                if viewModel.entries.isEmpty {
                    EmptyStateView()
                } else if viewModel.displayedEntries.isEmpty {
                    ContentUnavailableView.search(text: viewModel.searchText)
                } else {
                    List (viewModel.displayedEntries) { entry in
                        JournalCardView(entry: entry, viewModel: viewModel)
                            .onTapGesture {
                                selectedEntry = entry
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 6, leading:20, bottom:6, trailing:20 ))
                            .swipeActions(edge: .trailing, allowsFullSwipe: false)
                        {
                            Button(role: .destructive) {
                                entryToDelete = entry
                                showDeleteAlert = true
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(.semanticDestructive)
                        }
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
            .searchable(text: $viewModel.searchText)
            .sheet(isPresented: $showEditor) {
                JournalEditorView(viewModel: viewModel)
                    .presentationDragIndicator(.visible)
            }
            .sheet(item: $selectedEntry) { entry in
                JournalEditorView(viewModel: viewModel, entryToEdit: entry)
                    .presentationDragIndicator(.visible)
            }
            .alert("Delete Journal?", isPresented: $showDeleteAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    if let entry = entryToDelete {
                        viewModel.deleteEntry(entry)
                    }
                }
            } message: {
                Text("Are you sure you want to delete this journal?")
            }
        }
    }
}
#Preview {
    JournalListView()
        .preferredColorScheme(.dark)
}
