import SwiftUI

struct FavoriteSongsView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var isMenuOpen = false

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(themeManager.currentTheme.colors.components.navigationBarText)
                                .padding()
                        }
                        Spacer()
                    }
                    Text("Favorite Songs")
                        .font(themeManager.currentTheme.fonts.title)
                        .foregroundColor(themeManager.currentTheme.colors.components.navigationBarText)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(height: 44)
                .background(themeManager.currentTheme.colors.components.navigationBar)

                Spacer()
                Text("No favorite songs yet.")
                    .font(themeManager.currentTheme.fonts.body)
                    .foregroundColor(themeManager.currentTheme.colors.text)
                Spacer()
            }
            .background(themeManager.currentTheme.colors.background.ignoresSafeArea())

            SlidingMenu(isOpen: $isMenuOpen, delegate: ContentViewDelegate(navigationManager: navigationManager))
                .environmentObject(themeManager)
        }
    }
}
