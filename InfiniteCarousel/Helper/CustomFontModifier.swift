//
//  CustomFontModifier.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 23.09.2021.
//

import SwiftUI

struct CustomFontModifier: ViewModifier {
    var size: CGFloat = 28
    
    func body(content: Content) -> some View {
        content.font(.custom("OrnamentalVersals", size: size))
    }
}

extension View {
    func ornamentalVersals(size: CGFloat) -> some View {
        self.modifier(CustomFontModifier(size: size))
    }
}
