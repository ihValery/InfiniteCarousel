//
//  InfiniteCarouselView.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

struct InfiniteCarouselView: View {
    @Binding var tabs: [Tab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [Tab] = []
    
    var body: some View {
        TabView(selection: $fakeIndex) {
            ForEach(genericTabs) { tab in
                VStack(spacing: 0) {
                    
                    Text("\(tab.number)")
                        .font(.system(size: 200, weight: .bold, design: .rounded))
                        .foregroundColor(.yellow)
                        .shadow(color: .yellow.opacity(0.6), radius: 10, x: 1, y: 1)
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .cornerRadius(30)
                .padding(.horizontal, getRect().height < 750 ? 10 : 50)
                
                //Для аниированного перехода
                .overlay(
                    GeometryReader { gr in
                        Color.clear
                            .preference(key: OffsetKey.self, value: gr.frame(in: .global).minX)
                    }
                )
                .onPreferenceChange(OffsetKey.self, perform: { offset in
                    self.offset = offset
                })
                //Для аниированного перехода
                
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
        .onChange(of: offset) { newValue in
            if fakeIndex == 0 && offset == 0 {
                fakeIndex = genericTabs.count - 2
            }
            
            if fakeIndex == genericTabs.count - 1 && offset == 0 {
                fakeIndex = 1
            }
        }
                
        .onAppear {
            genericTabs = tabs
            
            //add first and last extra two items
            guard var first = genericTabs.first else { return }
            guard var last = genericTabs.last else { return }
            
            //updating ID else it will create issues in view of same ID
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
            
            fakeIndex = 1
        }
        
        //Updating real time
        .onChange(of: tabs) { newValue in
            genericTabs = tabs
            
            //add first and last extra two items
            guard var first = genericTabs.first else { return }
            guard var last = genericTabs.last else { return }
            
            //updating ID else it will create issues in view of same ID
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
        }
        
        //Updatind currentIndex
        .onChange(of: fakeIndex) { newValue in
            currentIndex = fakeIndex - 1
        }
    }
    
    func getIndex(tab: Tab) -> Int {
        let index = genericTabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        
        return index
    }
}

struct InfiniteCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteCarouselView(tabs: .constant([Tab(number: 1)]), currentIndex: .constant(0))
            .previewDevice("iPhone 12 Pro")
    }
}
