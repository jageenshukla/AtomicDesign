import SwiftUI

struct SongCell: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var favoriteSongs: Set<UUID> // Track favorite songs by their unique IDs
    let song: Song

    var isFavorite: Bool {
        favoriteSongs.contains(song.id)
    }

    var body: some View {
        HStack(spacing: 16) {
            SongCellImage(letter: String(song.name.prefix(1)))
                .environmentObject(themeManager)
            VStack(alignment: .leading) {
                SongTitle(title: song.name)
                    .environmentObject(themeManager)
                SongSubtitle(subtitle: song.artist)
                    .environmentObject(themeManager)
            }
            Spacer()
            Button(action: {
                if isFavorite {
                    favoriteSongs.remove(song.id)
                } else {
                    favoriteSongs.insert(song.id)
                }
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(themeManager.currentTheme.colors.components.favoriteIcon)
                    .tint(themeManager.currentTheme.colors.components.favoriteIcon)
            }
        }
        .padding()
    }
}
