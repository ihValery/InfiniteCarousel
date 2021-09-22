//
//  Home.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 0) {
            TopPanelButton()
                .overlay(
                    //Custom page indicator
                    HStack(spacing: 4) {
                        
                    }
                )
                .padding()
            
            //ScrollView for adapting for small screens
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                VStack(spacing: 20) {
                    Text("Prepare training")
                        .fontWeight(.bold)
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.top, 20)
                    
                    Text("Let's create a\ntraning plan\nfor you!")
                        .font(.system(size: 38, weight: .bold))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .foregroundColor(.white)
                    
                    //Carusel Slider
                    TabView {
                        
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
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
