//
//  TabBarView.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Tab Bar View
struct TabBarView: View {
    
    // MARK: - Properties
    
    @Binding var selectedTab: Tab
    
    // MARK: - View
    
    var body: some View {
        GeometryReader { geometry in
            let safeAreaBottom = geometry.safeAreaInsets.bottom
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Spacer()
                        VStack(spacing: 4) {
                            Image(systemName: tab.icon)
                                .font(.system(size: 20))
                                .foregroundColor(selectedTab == tab ? .green : .gray)
                            Text(tab.title)
                                .font(.caption2)
                                .foregroundColor(selectedTab == tab ? .green : .gray)
                        }
                        .onTapGesture {
                            selectedTab = tab
                        }
                        Spacer()
                    }
                } // HStack
                .padding(.top, 10)
                .padding(.bottom, 10 + safeAreaBottom)
                .background(Color(.systemBackground).shadow(radius: 3))
                .edgesIgnoringSafeArea(.bottom)
                .frame(width: geometry.size.width)
            } // VStack
        } // GeometryReader
        .frame(height: 60)
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
