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
            background: Color(.systemBackground),
            text: Color(.label),
            primary: Color(.systemBlue),
            secondary: Color(.systemGray),
            components: Theme.ComponentColors(
                loginButton: Theme.LoginButtonColors(
                    background: Color(.systemBlue),
                    text: Color(.white)
                ),
                navigationBar: Color(.systemBlue),
                navigationBarText: Color(.white),
                tabBar: Color(.systemGray6),
                cardBackground: Color(.secondarySystemBackground),
                textFieldBorder: Color(.systemGray4), // Add border color for text fields
                textFieldBackground: Color(.white), // Light theme text field background
                favoriteIcon: Color(.systemBlue) // Light theme favorite icon color
            )
        ),
        fonts: standardFonts
    )

    let darkTheme = Theme(
        colors: Theme.Colors(
            background: Color(.black),
            text: Color(.white),
            primary: Color(.yellow),
            secondary: Color(.gray),
            components: Theme.ComponentColors(
                loginButton: Theme.LoginButtonColors(
                    background: Color(.yellow),
                    text: Color(.black)
                ),
                navigationBar: Color(.yellow),
                navigationBarText: Color(.black),
                tabBar: Color(.black),
                cardBackground: Color(.gray),
                textFieldBorder: Color(.yellow), // Add border color for text fields
                textFieldBackground: Color(.darkGray), // Dark theme text field background
                favoriteIcon: Color(.orange) // Dark theme favorite icon color
            )
        ),
        fonts: standardFonts
    )
    
    let customTheme = Theme(
        colors: Theme.Colors(
            background: Color(.systemTeal),
            text: Color(.white),
            primary: Color(.systemIndigo),
            secondary: Color(.systemPink),
            components: Theme.ComponentColors(
                loginButton: Theme.LoginButtonColors(
                    background: Color(.systemIndigo),
                    text: Color(.white)
                ),
                navigationBar: Color(.systemTeal),
                navigationBarText: Color(.white),
                tabBar: Color(.systemTeal),
                cardBackground: Color(.systemTeal).opacity(0.8),
                textFieldBorder: Color(.systemIndigo),
                textFieldBackground: Color(.systemTeal).opacity(0.5),
                favoriteIcon: Color(.systemIndigo)
            )
        ),
        fonts: standardFonts
    )

    // Property to override the theme (nil means follow iOS system)
    private var overrideTheme: Theme?
    
    // Add a flag to track custom theme usage
    @Published var isCustomThemeEnabled: Bool = false
    
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
        if isCustomThemeEnabled {
            currentTheme = customTheme
        } else if let overrideTheme = overrideTheme {
            currentTheme = overrideTheme
        } else {
            let style = UITraitCollection.current.userInterfaceStyle
            currentTheme = style == .dark ? darkTheme : lightTheme
        }
    }
}

extension Notification.Name {
    static let themeDidChange = Notification.Name("themeDidChange")
}
