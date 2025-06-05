import SwiftUI

struct DynamicNavigationBar: UIViewControllerRepresentable {
    var backgroundColor: UIColor
    var titleColor: UIColor

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

                print("DynamicNavigationBar: Updating navigation bar appearance")
                print("DynamicNavigationBar: Background color - \(self.backgroundColor)")
                print("DynamicNavigationBar: Title color - \(self.titleColor)")

                appearance.backgroundColor = self.backgroundColor
                appearance.titleTextAttributes = [.foregroundColor: self.titleColor]
                appearance.largeTitleTextAttributes = [.foregroundColor: self.titleColor]

                navigationBar.standardAppearance = appearance
                navigationBar.scrollEdgeAppearance = appearance
                navigationBar.compactAppearance = appearance

                // Force navigation bar to refresh
                navigationBar.layoutIfNeeded()

                print("DynamicNavigationBar: Navigation bar appearance updated")
                print("DynamicNavigationBar: Resolved backgroundColor - \(self.backgroundColor)")
                print("DynamicNavigationBar: Resolved titleColor - \(self.titleColor)")
            } else {
                print("DynamicNavigationBar: Navigation bar not found")
            }
        }
    }
}
