import SwiftUI

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor

        appearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        appearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColors(backgroundColor: Color, titleColor: Color) -> some View {
        self.modifier(NavigationBarModifier(
            backgroundColor: UIColor(backgroundColor),
            titleColor: UIColor(titleColor)
        ))
    }
}
