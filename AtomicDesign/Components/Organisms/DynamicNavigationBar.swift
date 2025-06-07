import SwiftUI

struct DynamicNavigationBar: UIViewControllerRepresentable {
    @Binding var theme: Theme // Observe theme changes
    var backgroundColor: UIColor {
        UIColor(theme.colors.components.navigationBar)
    }
    var titleColor: UIColor {
        UIColor(theme.colors.components.navigationBarText)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear // Ensure the view is transparent
        updateNavigationBarAppearance(for: viewController)
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        updateNavigationBarAppearance(for: uiViewController)
    }

    private func updateNavigationBarAppearance(for viewController: UIViewController) {
        DispatchQueue.main.async {
            if let navigationBar = viewController.navigationController?.navigationBar {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()

                appearance.backgroundColor = self.backgroundColor
                appearance.titleTextAttributes = [.foregroundColor: self.titleColor]
                appearance.largeTitleTextAttributes = [.foregroundColor: self.titleColor]

                navigationBar.standardAppearance = appearance
                navigationBar.scrollEdgeAppearance = appearance
                navigationBar.compactAppearance = appearance

                // Force navigation bar to refresh
                navigationBar.layoutIfNeeded()
            }
        }
    }
}
