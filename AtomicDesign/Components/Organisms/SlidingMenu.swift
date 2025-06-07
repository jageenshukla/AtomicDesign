import SwiftUI

protocol SlidingMenuDelegate: AnyObject {
    func didRequestLogout()
}

struct SlidingMenu: View {
    @Binding var isOpen: Bool
    @EnvironmentObject var themeManager: ThemeManager
    weak var delegate: SlidingMenuDelegate? // Ensure delegate is passed

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

                    Toggle("Enable Custom Theme", isOn: Binding(
                        get: { themeManager.isCustomThemeEnabled },
                        set: { isEnabled in
                            themeManager.isCustomThemeEnabled = isEnabled
                            themeManager.setOverrideTheme(isEnabled ? themeManager.customTheme : nil)
                        }
                    ))
                    .padding()
                    .foregroundColor(themeManager.currentTheme.colors.text)

                    Button(action: {
                        withAnimation {
                            isOpen = false
                        }
                        // Notify delegate for logout
                        delegate?.didRequestLogout()
                    }) {
                        Text("Logout")
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
