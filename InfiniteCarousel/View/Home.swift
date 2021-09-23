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
//        ,
//        Tab(number: 4),
//        Tab(number: 5)
    ]
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
//            TopPanel()
//                .overlay(
//                    //Custom page indicator
//                    HStack(spacing: 5) {
//                        ForEach(tabs.indices, id: \.self) { index in
//                            Capsule()
//                                .fill(Color.white.opacity(currentIndex == index ? 1 : 0.5))
//                                .frame(width: currentIndex == index ? 18 : 4, height: 4)
//                                .animation(.easeInOut, value: currentIndex)
//                        }
//                    }
//                )
//                .padding()
            
            //ScrollView for adapting for small screens
//            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
            ScrollView(.init(), showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack {
                        Text("  I").foregroundColor(.yellow) + Text("nfinite").foregroundColor(.white)
                        Text("  C").foregroundColor(.yellow) + Text("arousel").foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .fixedSize()
                    .ornamentalVersals(size: 48)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(color: .white.opacity(0.6), radius: 20, x: 1, y: 1)
                    .offset(x: -15)
                    .padding(.top, getRect().height < 750 ? 16 : 50)
                    
                    Spacer()
                    
//                    Text("Let's create a\ntraning plan\nfor you!")
//                        .font(.largeTitle.bold())
//                        .multilineTextAlignment(.center)
//                        .lineLimit(3)
//                        .foregroundColor(.white)
                    
                    //Carusel Slider
                    InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
                    
                    Spacer()
                }
//                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
            //Custom page indicator
            HStack(spacing: 5) {
                ForEach(tabs.indices, id: \.self) { index in
                    Capsule()
                        .fill(Color.white.opacity(currentIndex == index ? 1 : 0.5))
                        .frame(width: currentIndex == index ? 18 : 4, height: 4)
                        .shadow(color: .white.opacity(0.6), radius: 10, x: 1, y: 1)
                        .animation(.easeInOut)
                }
            }
            .padding(.bottom, 50)
            
//            BottomPanel()
//            Button {
//                tabs.append(Tab(number: Int.random(in: 10...20)))
//            } label: {
//                Text("Добавление real time")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                    .frame(width: 200, height: 40)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
//                    )
//            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("background")
                .resizable()
//            LinearGradient(colors: [Color.blueApp, .purpleApp], startPoint: .top, endPoint: .bottom)
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
