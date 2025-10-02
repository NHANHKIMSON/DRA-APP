//
//  Untitled.swift
//  EasyCheck App
//
//  Created by Apple on 10/1/25.
//

import SwiftUICore

extension Font {
    static func customGlobalFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let fontName: String
        switch weight {
        case .bold:
            fontName = "MyCustomFont-Bold" // Replace with your font's PostScript name
        case .semibold:
            fontName = "MyCustomFont-Semibold" // Replace with your font's PostScript name
        default:
            fontName = "MyCustomFont-Regular" // Replace with your font's PostScript name
        }
        return .custom(fontName, size: size)
    }
}
