//
//  FloatingTextFieldView.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - FloatingTextField

struct FloatingTextField: View {
    
    // MARK: - Properties
    
    let title: String
    var keyboardType: UIKeyboardType = .default
    var isEditable: Bool = true

    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    private var shouldFloat: Bool {
        isFocused || !text.isEmpty
    }
    
    
    // MARK: - View
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.1))
                .frame(height: 48)

            Text(title)
                .foregroundColor(.gray)
                .font(.system(size: 17))
                .padding(.horizontal, 4)
                .scaleEffect(shouldFloat ? 0.8 : 1.0, anchor: .topLeading)
                .offset(
                    x: shouldFloat ? 12 : 0,
                    y: shouldFloat ? -34 : 0
                )
                .frame(maxWidth: .infinity, alignment: shouldFloat ? .leading : .center)
                .frame(height: 48, alignment: .center)
                .animation(.easeInOut(duration: 0.2), value: shouldFloat)
                .zIndex(1)
                .allowsHitTesting(false)

            TextField("", text: $text)
                .keyboardType(keyboardType)
                .focused($isFocused, equals: true)
                .padding(.horizontal, 12)
                .frame(height: 48)
                .tint(Color.appBaseColor)
                .disabled(!isEditable)
        } // Zstack
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(shouldFloat ? Color.appBaseColor : Color.clear, lineWidth: 1)
        )
    }
}

// MARK: - Preview

#Preview {
    FloatingTextFieldPreviewWrapper()
}

private struct FloatingTextFieldPreviewWrapper: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        FloatingTextField(title: "Country Code", keyboardType: .default, text: $text, isFocused: $isFocused)
            .padding()
    }
}
