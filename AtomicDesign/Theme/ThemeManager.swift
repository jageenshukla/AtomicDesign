//
//  ThemeManager.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

class ThemeManager: ObservableObject {
    // Singleton instance
    static let shared = ThemeManager()
    
    // Published property to notify SwiftUI views of theme changes
    @Published var currentTheme: Theme
    
    // Predefined themes
    let lightTheme = Theme(
        colors: Theme.Colors(
            background: .white,
            text: .black,
            primary: .blue,
            secondary: .gray,
            components: Theme.ComponentColors(
                loginButton: Theme.LoginButtonColors(
                    background: .green,
                    text: .white
                ),
                navigationBar: .blue,
                tabBar: .white,
                cardBackground: .gray
            )
        ),
        fonts: standardFonts
    )

    let darkTheme = Theme(
        colors: Theme.Colors(
            background: .black,
            text: .white,
            primary: .gray,
            secondary: .gray,
            components: Theme.ComponentColors(
                loginButton: Theme.LoginButtonColors(
                    background: .blue,
                    text: .white
                ),
                navigationBar: .gray,
                tabBar: .black,
                cardBackground: .gray
            )
        ),
        fonts: standardFonts
    )
    
    // Property to override the theme (nil means follow iOS system)
    private var overrideTheme: Theme?
    
    private init() {
        // Initialize with system theme
        let style = UITraitCollection.current.userInterfaceStyle
        currentTheme = style == .dark ? darkTheme : lightTheme
    }
    
    // Method to set or clear the override
    func setOverrideTheme(_ theme: Theme?) {
        overrideTheme = theme
        updateTheme()
    }
    
    func getThemeOverrideTheme() -> Theme? {
        return overrideTheme
    }
    // Update the current theme based on override or system settings
    func updateTheme() {
        if let overrideTheme = overrideTheme {
            currentTheme = overrideTheme
        } else {
            let style = UITraitCollection.current.userInterfaceStyle
            currentTheme = style == .dark ? darkTheme : lightTheme
        }
    }
}
