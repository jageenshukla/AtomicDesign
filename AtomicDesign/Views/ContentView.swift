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
                
                Button(action: {
                    // Toggle between dark mode override and system default
                    if themeManager.getThemeOverrideTheme() == nil {
                        themeManager.setOverrideTheme(themeManager.darkTheme)
                    } else {
                        themeManager.setOverrideTheme(nil)
                    }
                }) {
                    Text("Toggle Dark Mode")
                        .font(themeManager.currentTheme.fonts.body)
                        .foregroundColor(themeManager.currentTheme.colors.text)
                        .padding()
                }
                .padding(.bottom, 20)
            }
        }
        .onChange(of: colorScheme) { _ in
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
