import SwiftUI

struct SongListView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var searchText = ""

    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
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
            .background(
                DynamicNavigationBar(
                    backgroundColor: UIColor(themeManager.currentTheme.colors.components.navigationBar),
                    titleColor: UIColor(themeManager.currentTheme.colors.components.navigationBarText)
                )
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Hamburger menu action
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(themeManager.currentTheme.colors.components.navigationBarText) // Match theme text color
                    }
                }
            }
        }
    }
}
