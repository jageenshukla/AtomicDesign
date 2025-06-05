import SwiftUI

struct SlidingMenu: View {
    @Binding var isOpen: Bool
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        ZStack(alignment: .leading) {
            if isOpen {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isOpen = false
                        }
                    }

                VStack(alignment: .leading, spacing: 20) {

                    Spacer().frame(height: 50) // Add padding to avoid hiding behind the notch

                    Toggle("Toggle Theme", isOn: Binding(
                        get: { themeManager.currentTheme.isSame(as: themeManager.darkTheme) },
                        set: { isDark in
                            themeManager.setOverrideTheme(isDark ? themeManager.darkTheme : themeManager.lightTheme)
                        }
                    ))
                    .padding()
                    .foregroundColor(themeManager.currentTheme.colors.text)

                    Button(action: {
                        // Navigate to favorite songs
                    }) {
                        Text("Favorite Songs")
                            .foregroundColor(themeManager.currentTheme.colors.text)
                            .padding()
                    }

                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
                .background(themeManager.currentTheme.colors.background)
                .ignoresSafeArea()
            }
        }
    }
}
