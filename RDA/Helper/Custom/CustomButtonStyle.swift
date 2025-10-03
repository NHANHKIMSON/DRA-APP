//
//  CustomButtonStyle.swift
//  EasyCheck App
//
//  Created by Apple on 10/3/25.
//


import SwiftUI
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}