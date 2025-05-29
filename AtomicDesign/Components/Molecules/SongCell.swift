import SwiftUI

struct SongCell: View {
    let song: Song

    var body: some View {
        HStack(spacing: 16) {
            SongCellImage(letter: String(song.name.prefix(1)))
            VStack(alignment: .leading) {
                SongTitle(title: song.name)
                SongSubtitle(subtitle: song.artist)
            }
        }
        .padding()
    }
}
