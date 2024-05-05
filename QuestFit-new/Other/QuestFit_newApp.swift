//
//  RaccoonRemindApp.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/2/24.
//
import FirebaseCore
import SwiftUI

@main
struct QuestFit_newApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
