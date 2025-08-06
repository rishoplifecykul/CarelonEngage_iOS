//
//  HomeView.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Home Screen
struct HomeView: View {
    
    // MARK: - Properties
    
    @State private var selectedSegment: HomeScreenSegment = .following
    
    // MARK: - View
    
    var body: some View {
        VStack() {
            CustomSegmentPicker(selectedSegment: $selectedSegment, segments: HomeScreenSegment.allCases, titleForSelectedSegment: {$0.title})
                .padding(.top, 5)
            
            // MARK: - Segment Content
            
            Group {
                switch selectedSegment {
                case .following: FollowingView()
                case .myactivities: MyActivitiesView()
                case .featured: FeaturedView()
                }
            } // Group
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } // Vstack
    }
}

// MARK: - Preview

#Preview {
    HomeView()
}
