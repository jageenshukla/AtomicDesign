import SwiftUI

struct SongSubtitle: View {
    @EnvironmentObject var themeManager: ThemeManager
    let subtitle: String

    var body: some View {
        Text(subtitle)
            .font(.subheadline)
            .foregroundColor(themeManager.currentTheme.colors.text) // Use text color instead of secondary
    }
}
