import SwiftUI

class NavigationManager: ObservableObject {
    @Published var currentView: AppView = .login
}

enum AppView {
    case login
    case songList
    case favoriteSongs
}
