//
//  RaccoonRemindApp.swift
//  QuestFit
//
//  Created by Miguel Bunag & Ricardo Lopez
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
