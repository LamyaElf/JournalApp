//
//  JournalEditorView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 15/11/2026.
//

import SwiftUI

struct JournalEditorView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var content = ""
    @ObservedObject var viewModel: JournalViewModel
    @State private var showDiscardAlert = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                TextField("Title", text: $title)
                    .font(.headingL)
                    .foregroundStyle(.textPrimary)
                Text(Date.now.formatted(date: .numeric, time: .omitted))
                    .font(.captionM)
                    .foregroundStyle(.textSecondary)
                ZStack(alignment: .topLeading){
                    TextEditor(text: $content)
                        .font(.bodyL)
                        .padding(.leading, -5)
                        .scrollContentBackground(.hidden)
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
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Button{
                        if title.isEmpty && content.isEmpty {
                            dismiss ()
                        } else {
                            showDiscardAlert = true
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
                        viewModel.addEntry(title: title, content: content)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.glassProminent)
                }
                
            }
            
        }
    }
}
#Preview {
    JournalEditorView(viewModel: JournalViewModel())
        .preferredColorScheme(.dark)
}
