//
//  SplashView.swift
//  QuestFit
//
//  Created by Max Lopez on 2/28/24.
//

import SwiftUI

struct SplashView: View {
    @State private var username: String = ""
    @State private var isActive: Bool = false
    
    let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
    let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
    
    let splashDuration: TimeInterval = 2
    
    var body: some View {
        ZStack{
            VStack{
                Text("Welcome Back, \(username)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(accentColor)
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .onAppear(){
            if let savedUser = UserDefaults.standard.string(forKey: "username"){
                self.username = savedUser
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration){
                self.isActive = true
            }
        }
        .background(
                    NavigationLink(
                            destination: HomeView(),
                            isActive: $isActive,
                            label: EmptyView.init
                        )
                        .hidden()
                    )
    }
}

struct SplashView_Previews : PreviewProvider {
    static var previews : some View {
        SplashView()
    }
}
