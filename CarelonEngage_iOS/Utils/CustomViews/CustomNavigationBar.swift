//
//  CustomNavigationBar.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Custom Navigation Bar

struct CustomNavigationBar: View {
    
    // MARK: - Properties
    
    let title: String
    let showProfileButton: Bool
    let showNotificationButton: Bool
    
    // MARK: - Actions
    
    let onProfileButtonTap: (() -> Void)?
    let onNotificationButtonTap: (() -> Void)?
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
            
            Spacer()
            
            HStack(spacing: 0) {
                if showProfileButton && showNotificationButton {
                    Button(action: { onProfileButtonTap?() }) {
                        Image(systemName: "person.crop.circle")
                            .font(.headline)
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 20)
                    
                    Button(action: { onNotificationButtonTap?() }) {
                        Image(systemName: "bell")
                            .font(.headline)
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                } else if showProfileButton {
                    Button(action: { onProfileButtonTap?() }) {
                        Image(systemName: "person.crop.circle")
                            .font(.headline)
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                } else if showNotificationButton {
                    Button(action: { onNotificationButtonTap?() }) {
                        Image(systemName: "bell")
                            .font(.headline)
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                }
            } // HStack
        } // HStack
        .padding(.horizontal)
        .frame(height: 44)
        .background(Color.green.ignoresSafeArea())
    }
}

// MARK: - Preview

#Preview {
    CustomNavigationBar(title: "Home",
                        showProfileButton: true,
                        showNotificationButton: true,
                        onProfileButtonTap: { debugPrint("Profile button tapped")},
                        onNotificationButtonTap: {debugPrint("Notification button tapped")})
}
