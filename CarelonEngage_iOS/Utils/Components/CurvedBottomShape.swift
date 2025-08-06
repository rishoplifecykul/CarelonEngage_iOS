//
//  CurvedBottomShape.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - CurvedBottomShape

struct CurvedBottomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height

        path.move(to: CGPoint(x: 0, y: height * 0.01))
        path.addCurve(to: CGPoint(x: width, y: height * 0.5),
                      control1: CGPoint(x: width * 0.35, y: height * 0.05),
                      control2: CGPoint(x: width * 0.65, y: height * 0.8))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()

        return path
    }
}
