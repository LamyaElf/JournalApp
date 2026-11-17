//
//  JournalEditorView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 15/11/2026.
//

import SwiftUI

struct JournalEditorView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: JournalViewModel
    var entryToEdit: JournalEntry? = nil
    @State private var title = ""
    @State private var content = ""
    @State private var showDiscardAlert = false
    @FocusState private var isTitleFocused: Bool
    private var hasChanges: Bool {
        if let entry = entryToEdit {
            return title != entry.title || content != entry.content
        } else {
            return !title.isEmpty || !content.isEmpty
        }
    }
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                TextField("Title", text: $title)
                    .font(.headingL)
                    .foregroundStyle(.primary)
                    .focused($isTitleFocused)
                Text((entryToEdit?.date ?? Date.now).formatted(date: .numeric, time: .omitted))
                    .font(.captionM)
                    .foregroundStyle(.textSecondary)
                ZStack(alignment: .topLeading){
                    TextEditor(text: $content)
                        .font(.bodyL)
                        .padding(.leading, -5)
                        .scrollContentBackground(.hidden)
                        .scrollDismissesKeyboard(.interactively)
                    if content.isEmpty {
                        Text("Type your Journal...")
                            .font(.bodyL)
                            .foregroundStyle(Color(.placeholderText))
                            .padding(.top, 8)
                            .allowsHitTesting(false)
                    }
                }
                .padding(.top, 24)
            }
            .padding(.horizontal, 20)
            .onAppear {
                if let entry = entryToEdit {
                    title = entry.title
                    content = entry.content
                    
                }
                
                if entryToEdit == nil {
                    isTitleFocused = true
                }
            }
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Button{
                        if hasChanges {
                            showDiscardAlert = true
                        } else {
                            dismiss()
                        }
                    } label: {
                        Image(systemName:"xmark")
                            .confirmationDialog("Are you sure you want to discard changes on this journal?",
                                                isPresented: $showDiscardAlert,
                                                titleVisibility: .visible)
                        {
                            Button("Discard Changes", role: .destructive) {
                                dismiss()
                            }
                            Button("Keep Editing") { }
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        if let entry = entryToEdit {
                            viewModel.updateEntry(entry, title: title, content: content)
                        } else {
                            viewModel.addEntry(title: title, content: content)
                        }
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.glassProminent)
                    .disabled(!hasChanges)
                }
                
            }
            
        }
    }
}
#Preview {
    JournalEditorView(viewModel: JournalViewModel())
        .preferredColorScheme(.dark)
}
