//
//  SettingRowView.swift
//  QuestFit
//
//  Created by Miguel Bunag on 3/1/24.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .foregroundColor(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View{
        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}
