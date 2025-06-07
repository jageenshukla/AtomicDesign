//
//  Theme.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct Theme {
    struct Colors {
        let background: Color
        let text: Color
        let primary: Color
        let secondary: Color
        let components: ComponentColors
    }

    struct ComponentColors {
        let loginButton: LoginButtonColors
        let navigationBar: Color
        let navigationBarText: Color
        let tabBar: Color
        let cardBackground: Color
        let textFieldBorder: Color // Add border color for text fields
        let textFieldBackground: Color // Add background color for text fields
        let favoriteIcon: Color // Add color for favorite icon
    }

    struct LoginButtonColors {
        let background: Color
        let text: Color
    }

    let colors: Colors
    let fonts: Fonts

    func isSame(as other: Theme) -> Bool {
        return self.colors.background.description == other.colors.background.description &&
               self.colors.text.description == other.colors.text.description &&
               self.colors.primary.description == other.colors.primary.description &&
               self.colors.secondary.description == other.colors.secondary.description &&
               self.colors.components.navigationBar.description == other.colors.components.navigationBar.description &&
               self.colors.components.navigationBarText.description == other.colors.components.navigationBarText.description
    }
}
