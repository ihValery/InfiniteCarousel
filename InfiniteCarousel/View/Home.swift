//
//  Home.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

struct Home: View {
    
    @State var tabs: [Tab] = [
        Tab(number: 1),
        Tab(number: 2),
        Tab(number: 3)
    ]
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.init(), showsIndicators: false) {
                VStack(spacing: 20) {
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
                    
                    Spacer()
                    
                    //Carusel Slider
                    InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
                    
                    Spacer()
                }
//                .frame(maxWidth: .infinity, alignment: .center)
            }
            
            //Custom page indicator
            PageIndicator(tabs: tabs, currentIndex: currentIndex)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewDevice("iPhone 13 Pro")
    }
}
