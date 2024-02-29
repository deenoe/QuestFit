//
//  LoggedInView.swift
//  QuestFit
//
//  Created by Miguel Bunag on 2/29/24.
//
import Foundation
import SwiftUI

struct LoggedInView: View {
    @State var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "check")
    var body: some View {
        if !isLoggedIn{
            OnboardingView()
        }
        else{
            HomeView()
        }
        
    }
}

#Preview {
    NavigationView {
        LoggedInView()
    }
}
