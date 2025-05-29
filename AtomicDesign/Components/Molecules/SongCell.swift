import SwiftUI

struct SongCell: View {
    @EnvironmentObject var themeManager: ThemeManager
    let song: Song

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
        }
        .padding()
    }
}
