//
//  LoginButton.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct LoginButton: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.colorScheme) private var colorScheme
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(themeManager.currentTheme.fonts.body)
                .foregroundColor(.white)
                .padding()  
                .frame(maxWidth: .infinity)
                .background(themeManager.currentTheme.colors.components.loginButton.background)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
