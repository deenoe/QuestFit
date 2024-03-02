//
//  DailyQuestsView.swift
//  QuestFit
//
//  Created by Max Lopez on 2/22/24.
//

import SwiftUI

struct DailyQuestsView: View {
    var body: some View {
        // let mainColor = Color(red: 0/255, green: 55/255, blue: 0/255)
        let accentColor = Color(red: 152/255, green: 158/255, blue: 143/255)
        
        ZStack{
            Color(accentColor)
                .ignoresSafeArea()
            Text("Daily Quests Here")
        }
    }
}

#Preview {
    DailyQuestsView()
}
