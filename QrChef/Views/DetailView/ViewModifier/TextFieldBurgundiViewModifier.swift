//
//  TextFieldBurgundiViewModifier.swift
//  QrChef
//
//  Created by Tatiana Simmer on 01/12/2022.
//


import SwiftUI


struct TextFieldBurgundiViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 8)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color.redBurgundy, lineWidth: 1)
                
            }
    }
}

extension View {
    func applyBurgundiStyle() -> some View {
        self.modifier(TextFieldBurgundiViewModifier())
    }
}
