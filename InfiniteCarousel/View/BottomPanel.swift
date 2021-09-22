//
//  BottomPanel.swift
//  InfiniteCarousel
//
//  Created by Валерий Игнатьев on 22.09.2021.
//

import SwiftUI

struct BottomPanel: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("Next Step")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
                    )
            }

            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "chevron.right")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
                    )
            }
        }
        .padding(.top, 25)
        .padding(.horizontal, 30)
        .padding(.bottom, 12)
        .background(
            Color.black
                .clipShape(CustomCorners(corner: [.topLeft, .topRight], radius: 38))
                .ignoresSafeArea()
        )
    }
}

struct BottomPanel_Previews: PreviewProvider {
    static var previews: some View {
        BottomPanel()
            .previewDevice("iPhone 12 Pro")
    }
}
