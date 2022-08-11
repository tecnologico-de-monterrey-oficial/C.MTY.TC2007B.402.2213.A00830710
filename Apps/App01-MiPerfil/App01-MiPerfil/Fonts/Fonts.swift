//
//  Fonts.swift
//  App01-MiPerfil
//
//  Created by Alumno on 11/08/22.
//


import Foundation
import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Roboto-Bold", size: 16 ))
            .foregroundColor(.white)
    }
}
