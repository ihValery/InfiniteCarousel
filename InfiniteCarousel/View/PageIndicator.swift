//
//  PageIndicator.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 25.09.2021.
//

import SwiftUI

struct PageIndicator: View {
    var tabs: Array<Any>
    var currentIndex: Int
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(tabs.indices) { index in
                Capsule()
                    .fill(Color.white.opacity(currentIndex == index ? 1 : 0.5))
                    .frame(width: currentIndex == index ? 18 : 4, height: 4)
                    .shadow(color: .white.opacity(0.6), radius: 10, x: 1, y: 1)
                    .animation(.easeInOut)
            }
        }
        .padding(.bottom, 50)
    }
}
