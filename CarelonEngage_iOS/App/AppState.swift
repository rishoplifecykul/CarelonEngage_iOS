//
//  AppState.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - APP State

class AppState: ObservableObject {
    @Published var showSplashScreen: Bool = true
    @Published var isLoggedIn: Bool = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showSplashScreen = false
        }
        
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}
