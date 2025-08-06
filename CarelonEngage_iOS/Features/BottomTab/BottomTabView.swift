//
//  BottomTabView.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Bottom Tab View
struct BottomTabView: View {
    
    // MARK: - Properties
    
    @State private var selectedTab: Tab = .home
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: selectedTab.title,
                                showProfileButton: selectedTab == .home,
                                showNotificationButton: true,
                                onProfileButtonTap: {},
                                onNotificationButtonTap: {}
            )
            
            ZStack {
                switch selectedTab {
                case .home:
                    NavigationStack { HomeView() }
                case .programs:
                    NavigationStack { EmptyView() }
                case .record:
                    NavigationStack { EmptyView() }
                case .search:
                    NavigationStack { EmptyView() }
                case .menu:
                    NavigationStack { EmptyView() }
                }
            } // ZStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBarView(selectedTab: $selectedTab)
            
        }// VStack
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - Preview

#Preview {
    BottomTabView()
}
