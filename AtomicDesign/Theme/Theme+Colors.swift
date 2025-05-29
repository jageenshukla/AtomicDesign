//
//  Theme+Colors.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

extension Theme.Colors {
    struct Button {
        static let background: Color = Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .gray : .blue
        })
    }
    
    struct LoginButton {
        static let background: Color = Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .blue : .green
        })
    }
}
