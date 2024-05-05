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
                .foregroundColor(.gray)
                .rotationEffect(Angle(degrees:angle))
            VStack{
                Image("RACCOON")
                    .resizable()
                    .scaledToFit()
                    .frame(width:80, height:80)
                Text (title)
                    .foregroundColor(.white)
                    .bold()
                    .monospaced()
                    .font(.system(size:40))
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .monospaced()
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 500)
        .offset(y:-180)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: Color.gray)
}
