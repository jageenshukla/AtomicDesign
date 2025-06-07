//
//  AtomicDesignApp.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

@main
struct AtomicDesignApp: App {
    let themeManager = ThemeManager.shared
    let navigationManager = NavigationManager() // Add navigation manager

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .environmentObject(navigationManager) // Provide navigation manager to environment
        }
    }
}
