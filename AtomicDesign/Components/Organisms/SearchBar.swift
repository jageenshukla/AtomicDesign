import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        TextField("Search songs", text: $searchText)
            .padding(8)
            .background(themeManager.currentTheme.colors.components.textFieldBackground)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(themeManager.currentTheme.colors.components.textFieldBorder, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}
