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
    }

    struct LoginButtonColors {
        let background: Color
        let text: Color
    }

    let colors: Colors
    let fonts: Fonts
}
