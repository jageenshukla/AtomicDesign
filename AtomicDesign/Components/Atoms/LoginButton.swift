//
//  LoginButton.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct LoginButton: View {
    @EnvironmentObject var themeManager: ThemeManager
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(themeManager.currentTheme.fonts.body)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Theme.Colors.LoginButton.background)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
