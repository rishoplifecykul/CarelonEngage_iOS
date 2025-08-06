//
//  ContentView.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: -  Main App View
struct ContentView: View {
    
    @StateObject private var appState = AppState()
    
    var body: some View {
        Group {
            if appState.showSplashScreen {
                SplashScreen()
            } else {
                if appState.isLoggedIn {
                    BottomTabView()
                } else {
                    LoginView()
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
