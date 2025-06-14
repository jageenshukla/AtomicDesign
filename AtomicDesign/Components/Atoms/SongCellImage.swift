import SwiftUI

struct SongCellImage: View {
    @EnvironmentObject var themeManager: ThemeManager
    let letter: String

    var body: some View {
        Text(letter)
            .font(.title)
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
            .background(themeManager.currentTheme.colors.primary) // Dynamically update background color
            .clipShape(Circle())
    }
}
