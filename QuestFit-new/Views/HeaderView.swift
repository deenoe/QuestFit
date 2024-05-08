//
//  HeaderView.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees:angle))
            VStack{
                Image("knight")
                    .resizable()
                    .scaledToFit()
                    .frame(width:90, height:90)
                Text (title)
                    .foregroundColor(.white)
                    .bold()
                    .monospaced()
                    .font(.system(size:40))
                Text(subtitle)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .monospaced()
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 400)
        .offset(y:-100)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: Color.gray)
}
