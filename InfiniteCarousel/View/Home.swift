//
//  Home.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

struct Home: View {
    
    @State var tabs: [Tab] = [Tab(number: 1), Tab(number: 2), Tab(number: 3)]    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Heading()
  
//            ScrollView(.init(), showsIndicators: false) {
//                VStack {
//                    Spacer()
//
//                    //Carusel Slider
//                    InfiniteCarousel(tabs: $tabs, currentIndex: $currentIndex)
//
//                    Spacer()
//                }
//            }
            
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
