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
        //,
//        Tab(number: 4),
//        Tab(number: 5),
//        Tab(number: 6)
    ]
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TopPanel()
                .overlay(
                    //Custom page indicator
                    HStack(spacing: 5) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Capsule()
                                .fill(Color.white.opacity(currentIndex == index ? 1 : 0.5))
                                .frame(width: currentIndex == index ? 18 : 4, height: 4)
                                .animation(.easeInOut, value: currentIndex)
                        }
                    }
                )
                .padding()
            
            //ScrollView for adapting for small screens
//            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
            ScrollView(.init(), showsIndicators: false) {
                VStack(spacing: 20) {
                    Text("Infinite Carousel")
                        .bold()
                        .foregroundColor(.white)
                    
//                    Text("Let's create a\ntraning plan\nfor you!")
//                        .font(.largeTitle.bold())
//                        .multilineTextAlignment(.center)
//                        .lineLimit(3)
//                        .foregroundColor(.white)
                    
                    //Carusel Slider
                    InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
//            BottomPanel()
            Button {
                tabs.append(Tab(number: Int.random(in: 10...20)))
            } label: {
                Text("Добавление real time")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
                    )
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color.blueApp, .purpleApp], startPoint: .top, endPoint: .bottom)
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
