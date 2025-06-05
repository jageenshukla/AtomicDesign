//
//  ContentView.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var navigationManager: NavigationManager // Add navigation manager
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            themeManager.currentTheme.colors.background
                .ignoresSafeArea()

            switch navigationManager.currentView {
            case .login:
                LoginForm()
            case .songList:
                SongListView()
            case .favoriteSongs:
                FavoriteSongsView() // Updated to include navigation bar
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

class ContentViewDelegate: SlidingMenuDelegate {
    private let navigationManager: NavigationManager

    init(navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
    }

    func didRequestLogout() {
        navigationManager.currentView = .login
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
