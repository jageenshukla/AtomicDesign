import SwiftUI

struct DynamicNavigationBar: UIViewControllerRepresentable {
    var backgroundColor: UIColor
    var titleColor: UIColor

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
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
                appearance.backgroundColor = backgroundColor
                appearance.titleTextAttributes = [.foregroundColor: titleColor]
                appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]

                navigationBar.standardAppearance = appearance
                navigationBar.scrollEdgeAppearance = appearance
                navigationBar.compactAppearance = appearance
            }
        }
    }
}
