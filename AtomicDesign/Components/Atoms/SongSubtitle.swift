import SwiftUI

struct SongSubtitle: View {
    let subtitle: String

    var body: some View {
        Text(subtitle)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}
