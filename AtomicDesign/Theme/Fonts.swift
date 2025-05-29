//
//  Fonts.swift
//  AtomicDesign
//
//  Created by Shukla, Jageen | Jageen | ESDD on 2025/05/29.
//

import SwiftUI

struct Fonts {
    let title: Font
    let body: Font
    let footnote: Font
}

// Shared font styles for most themes
let standardFonts = Fonts(
    title: .system(size: 24, weight: .bold),
    body: .system(size: 16),
    footnote: .system(size: 12)
)
