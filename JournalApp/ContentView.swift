//
//  ContentView.swift
//  JournalApp
//
//  Created by lamyaeialfawwaz on 09/11/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        if showSplash {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                        withAnimation {
                            showSplash = false
                        }
                    }
                }
        } else {
            JournalListView()
        }
    }
}

#Preview {
    ContentView()
}
