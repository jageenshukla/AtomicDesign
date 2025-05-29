import SwiftUI

struct SongListView: View {
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
            VStack {
                SearchBar(searchText: $searchText)
                List(filteredSongs, id: \ .name) { song in
                    SongCell(song: song)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Songs")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Hamburger menu action
                    }) {
                        Image(systemName: "line.horizontal.3")
                    }
                }
            }
        }
    }
}
