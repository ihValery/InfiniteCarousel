//
//  Heading.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 25.09.2021.
//

import SwiftUI

struct Heading: View {
    var body: some View {
        VStack {
            Text("  I").foregroundColor(.yellow) + Text("nfinite").foregroundColor(.white)
            Text("  C").foregroundColor(.yellow) + Text("arousel").foregroundColor(.white)
        }
        .ornamentalVersals(size: 48)
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .shadow(color: .white.opacity(0.6), radius: 20, x: 1, y: 1)
        .offset(x: -15)
        .padding(.top, getRect().height < 750 ? 16 : 50)
    }
}

struct Heading_Previews: PreviewProvider {
    static var previews: some View {
        Heading()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro")
    }
}
