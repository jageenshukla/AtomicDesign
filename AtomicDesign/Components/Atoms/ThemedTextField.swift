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
                    .textFieldStyle(.roundedBorder)
                    .font(themeManager.currentTheme.fonts.body)
                    .foregroundColor(themeManager.currentTheme.colors.text)
                    .background(themeManager.currentTheme.colors.background)
            } else {
                TextField(placeholder, text: $text)
                    .textFieldStyle(.roundedBorder)
                    .font(themeManager.currentTheme.fonts.body)
                    .foregroundColor(themeManager.currentTheme.colors.text)
                    .background(themeManager.currentTheme.colors.background)
            }
        }
    }
}
