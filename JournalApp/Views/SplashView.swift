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
            LinearGradient(colors: [.black, .gradientMid, .gradientLight],
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            VStack {
                Image("SplashScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                Text("Journali")
                    .font(.display)
                    .foregroundStyle(.primary)
                    .shadow(color: .gray, radius: 1)
                    .shadow(color: .gray, radius: 1)
                Text("Your thoughts, your story")
                    .font(.bodySupporting)
                    .foregroundStyle(.primary)
                    .tracking(1)
            }
        }
    }
}

#Preview {
    SplashView()
        .preferredColorScheme(.dark)
}
