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
                    List (viewModel.entries) { entry in
                        Text(entry.title)
                    }
                }
                }
                .navigationTitle("Journal")
                .toolbarTitleDisplayMode(.inlineLarge)
                .toolbar{
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Menu{
                            Button("Sort by Bookmark"){}
                            Divider()
                            Button("Sort by Entry Date"){}
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
