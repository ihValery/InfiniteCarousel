//
//  InfiniteCarouselView.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

struct InfiniteCarousel: View {
    @Binding var tabs: [Tab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    @State var offset: CGFloat = 0
    
    var body: some View {
        TabView(selection: $fakeIndex) {
            ForEach(tabs) { tab in
                VStack(spacing: 0) {
                    
                    Text("\(tab.number)")
                        .ornamentalVersals(size: getRect().height < 750 ? 300 : 390)
                        .offset(x: 10, y: -30)
                        .foregroundColor(.yellow)
                        .shadow(color: .yellow.opacity(0.6), radius: 10, x: 0, y: 0)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                //For animation transition
                .overlay(
                    GeometryReader { gr in
                        Color.clear
                            .preference(key: OffsetKey.self, value: gr.frame(in: .global).minX)
                    }
                )
                .onPreferenceChange(OffsetKey.self) { offset in
                    self.offset = offset
                }
                //For animation transition

                .tag(getIndex(tab: tab))
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(maxHeight: 350)
                
        //Logic
        //Add first item to last and when ever content is scrolled to last just scroll back fo first without animation
        //add last item to first and do the same
        //so it will create infinite carousel type animation
        
        //To avoid glitch
        //Updating after user released
        .onChange(of: offset) { _ in
            if fakeIndex == 0 && offset == 0 {
                fakeIndex = tabs.count - 2
            }
            
            if fakeIndex == tabs.count - 1 && offset == 0 {
                fakeIndex = 1
            }
            
            currentIndex = fakeIndex - 1
        }
                
        .onAppear {
            //add first and last extra two items
            guard var first = tabs.first else { return }
            guard var last = tabs.last else { return }
            
            //updating ID else it will create issues in view of same ID
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            tabs.append(first)
            tabs.insert(last, at: 0)
            
            fakeIndex = 1
        }
    }
    
    func getIndex(tab: Tab) -> Int {
        let index = tabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        
        return index
    }
}

struct InfiniteCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteCarousel(tabs: .constant([Tab(number: 1)]), currentIndex: .constant(0))
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro")
    }
}
