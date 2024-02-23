//
//  ContentView.swift
//  QuestFit
//
//  Created by Miguel Bunag on 2/14/24.
//
import Foundation
import SwiftUI

// (red: 0/255, green: 100/255, blue: 60/255)

struct OnboardingView: View {
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [mainColor, .white]), center: .center, startRadius: 0, endRadius: 2500) // Adjust the endRadius as needed
                    .ignoresSafeArea()
            VStack{
        
                Image("frodge3")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .mask(
                        RadialGradient(gradient: Gradient(colors: [.black, .clear]), center: .center, startRadius: 0, endRadius: 2500))
                Text("QuestFit")
                    .bold()
                    .monospaced()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(accentColor)
                    .font(.largeTitle)
                    .padding()
                Text("Ready to start your journey?")
                    .padding()
                    // .frame(width:300)
                    .foregroundStyle(accentColor)
                    .monospaced()
                    .italic()
                    .bold()
                    .font(.callout)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: SignUpView()) {
                    Text("Start")
                        .monospaced()
                        .font(.body)
                        .padding()
                        .bold()
                        .border(accentColor)
                        .foregroundColor(mainColor)
                        .background(accentColor)}
                        .padding()
                
            }
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OnboardingView()
        }
        .navigationBarBackButtonHidden(true)
    }
}
