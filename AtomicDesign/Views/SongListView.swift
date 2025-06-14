import SwiftUI

struct SongListView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var searchText = ""
    @State private var isMenuOpen = false // State to manage menu visibility
    @State private var favoriteSongs = Set<UUID>() // Track favorite songs

    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) { // Remove spacing between elements
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(themeManager.currentTheme.colors.components.navigationBarText) // Match theme text color
                                .padding()
                        }
                        Spacer()
                    }
                    Text("Songs")
                        .font(themeManager.currentTheme.fonts.title)
                        .foregroundColor(themeManager.currentTheme.colors.components.navigationBarText)
                        .frame(maxWidth: .infinity, alignment: .center) // Ensure the title is centered
                }
                .frame(height: 44)
                .background(themeManager.currentTheme.colors.components.navigationBar)

                SearchBar(searchText: $searchText)
                    .environmentObject(themeManager)
                    .padding(.top, 8) // Add margin at the top of the search bar

                List(filteredSongs, id: \ .id) { song in
                    SongCell(favoriteSongs: $favoriteSongs, song: song)
                        .environmentObject(themeManager)
                        .listRowBackground(themeManager.currentTheme.colors.background) // Dynamically set row background color
                }
                .listStyle(.plain) // Remove default list margins
            }
            .background(themeManager.currentTheme.colors.background.ignoresSafeArea())

            SlidingMenu(isOpen: $isMenuOpen)
                .environmentObject(themeManager)
        }
        .overlay(
            DynamicNavigationBar(theme: $themeManager.currentTheme) // Pass theme as a binding
                .allowsHitTesting(false) // Ensure it does not block touch interactions
        )
    }
}
