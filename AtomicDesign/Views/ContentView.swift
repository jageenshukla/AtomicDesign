//
//  ContentView.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            themeManager.currentTheme.colors.background
                .ignoresSafeArea()

            VStack {
                LoginForm()
            }
        }
        .onAppear {
            // Ensure theme is updated on initial appearance
            if themeManager.getThemeOverrideTheme() == nil {
                themeManager.updateTheme()
            }
        }
        .onChange(of: colorScheme) {
            // Update theme when system color scheme changes, if no override
            if themeManager.getThemeOverrideTheme() == nil {
                themeManager.updateTheme()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ThemeManager.shared)
    }
}
#Preview {
    ContentView()
}
