import SwiftUI

struct SongTitle: View {
    @EnvironmentObject var themeManager: ThemeManager
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(themeManager.currentTheme.colors.text)
    }
}
