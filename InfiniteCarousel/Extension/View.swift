//
//  View.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

extension View {
    func getRect () -> CGRect {
        UIScreen.main.bounds
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return null }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else { return null }
        
        return safeArea
    }
}
