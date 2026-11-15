//
//  EmptyStateView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 12/11/2026.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
            VStack (spacing: 0){
                Image("EmptyState")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .padding(.bottom, 29)
                Text("Begin Your Journal")
                    .font(.headingM)
                    .foregroundStyle(.textAccent)
                    .padding(.bottom, 16)
                Text("Craft your personal diary, tap the plus icon to begin")
                    .font(.bodySupporting)
                    .foregroundStyle(.textPrimary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,60)
                    .tracking(0.6)
            }
        
    }
}

#Preview {
    EmptyStateView()
        .preferredColorScheme(.dark)
}
