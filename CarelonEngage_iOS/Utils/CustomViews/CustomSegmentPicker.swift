//
//  CustomSegmentPicker.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Custom Segment Picker
struct CustomSegmentPicker<Segment: SegmentProtocol>: View {
    
    // MARK: - Properities
    @Binding var selectedSegment: Segment
    let segments: [Segment]
    let titleForSelectedSegment: (Segment) -> String
    
    // MARK: - View
    var body: some View {
        Picker("Select Segment", selection: $selectedSegment) {
            ForEach(segments) { segment in
                Text(titleForSelectedSegment(segment)).tag(segment)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

// MARK: - Preview
#Preview {
    CustomSegmentPicker(
        selectedSegment: .constant(.following),
        segments: HomeScreenSegment.allCases,
        titleForSelectedSegment: { $0.title }
    )
}
