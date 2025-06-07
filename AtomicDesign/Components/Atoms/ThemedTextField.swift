//
//  ThemedTextField.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct ThemedTextField: View {
    @EnvironmentObject var themeManager: ThemeManager
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(8)
                    .background(themeManager.currentTheme.colors.components.textFieldBackground) // Use theme-specific background color
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(themeManager.currentTheme.colors.components.textFieldBorder, lineWidth: 1) // Add border
                    )
                    .font(themeManager.currentTheme.fonts.body)
                    .foregroundColor(themeManager.currentTheme.colors.text)
            } else {
                TextField(placeholder, text: $text)
                    .padding(8)
                    .background(themeManager.currentTheme.colors.components.textFieldBackground) // Use theme-specific background color
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(themeManager.currentTheme.colors.components.textFieldBorder, lineWidth: 1) // Add border
                    )
                    .font(themeManager.currentTheme.fonts.body)
                    .foregroundColor(themeManager.currentTheme.colors.text)
            }
        }
    }
}
