import SwiftUI

struct SongListView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var searchText = ""
    @State private var isMenuOpen = false // State to manage menu visibility

    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 0) { // Remove spacing between elements
                    SearchBar(searchText: $searchText)
                        .environmentObject(themeManager)
                    List(filteredSongs, id: \ .name) { song in
                        SongCell(song: song)
                            .environmentObject(themeManager)
                            .listRowBackground(themeManager.currentTheme.colors.background) // Dynamically set row background color
                    }
                    .listStyle(.plain) // Remove default list margins
                }
                .background(themeManager.currentTheme.colors.background.ignoresSafeArea())
                .navigationTitle("Songs")
                .navigationBarColors(
                    backgroundColor: themeManager.currentTheme.colors.components.navigationBar,
                    titleColor: themeManager.currentTheme.colors.components.navigationBarText
                )
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: isMenuOpen ? "xmark" : "line.horizontal.3")
                                .foregroundColor(themeManager.currentTheme.colors.components.navigationBarText) // Match theme text color
                        }
                    }
                }
            }

            SlidingMenu(isOpen: $isMenuOpen)
                .environmentObject(themeManager)
        }
    }
}
