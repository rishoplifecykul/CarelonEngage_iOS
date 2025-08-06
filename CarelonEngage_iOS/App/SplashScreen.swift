//
//  SplashScreen.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Splash Screen
struct SplashScreen: View {
    
    // MARK: - View
    
    var body: some View {
        Image("SplashScreen")
            .resizable()
            .ignoresSafeArea()
    }
}

// MARK: - Preview

#Preview {
    SplashScreen()
}
