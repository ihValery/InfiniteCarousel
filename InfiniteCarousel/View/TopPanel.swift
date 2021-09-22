//
//  TopPanel.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

struct TopPanel: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "chevron.left")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
                    )
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Skip")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
                    )
            }
        }
    }
}

struct TopPanelButton_Previews: PreviewProvider {
    static var previews: some View {
        TopPanel()
            .previewDevice("iPhone 13 Pro")
    }
}
