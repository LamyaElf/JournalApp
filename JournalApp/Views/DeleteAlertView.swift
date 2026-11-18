//
//  DeleteAlertView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 18/11/2026.
//

import SwiftUI
struct DeleteAlertView: View {
    let onCancel: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Delete Journal?")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.textPrimary)
            
            Text("Are you sure you want to delete this journal?")
                .font(.system(size: 15))
                .foregroundStyle(.textSecondary)
            
            HStack(spacing: 12) {
                Button {
                    onCancel()
                } label: {
                    Text("Cancel")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.white.opacity(0.12), in: Capsule())
                }
                .buttonStyle(.plain)
                
                Button {
                    onDelete()
                } label: {
                    Text("Delete")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(.semanticDestructive, in: Capsule())
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 12)
        }
        .padding(20)
        .glassEffect(in: RoundedRectangle(cornerRadius: 32))
        .padding(.horizontal, 40)
    }
}

#Preview {
    DeleteAlertView(onCancel: { }, onDelete: { })
        .preferredColorScheme(.dark)
}
