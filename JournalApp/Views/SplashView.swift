//
//  SplashView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 11/11/2026.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .gradientMid, .gradientLight], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Image("SplashScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                Text("Journali")
                    .font(.display)
                    .foregroundStyle(.textPrimary)
                    .shadow(color: .gray, radius: 1)
                    .shadow(color: .gray, radius: 1)
                Text("Your thoughts, your story")
                    .font(.bodySupporting)
                    .foregroundStyle(.textPrimary)
                    .tracking(1)
            }
        }
    }
}
#Preview {
    SplashView()
}
