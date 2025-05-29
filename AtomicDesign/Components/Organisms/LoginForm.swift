//
//  LoginForm.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct LoginForm: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            SongListView()
        } else {
            VStack(spacing: 16) {
                Text("LOGIN")
                    .font(themeManager.currentTheme.fonts.header)
                    .foregroundColor(themeManager.currentTheme.colors.text)

                ThemedTextField(placeholder: "ID", text: $id)
                ThemedTextField(placeholder: "Password", text: $password, isSecure: true)
                LoginButton(title: "Login") {
                    isLoggedIn = true
                }
            }
            .padding(.horizontal, 16)
            .background(themeManager.currentTheme.colors.background)
        }
    }
}
