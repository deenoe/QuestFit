//
//  SettingsView.swift
//  QuestFit
//
//  Created by Max Lopez on 2/28/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General")) {
                    Button(action: {
                        // Action for Setting 1
                    }) {
                        Text("Setting 1")
                    }
                    Button(action: {
                        // Action for Setting 2
                    }) {
                        Text("Setting 2")
                    }
                    Button(action: {
                        // Action for Setting 3
                    }) {
                        Text("Setting 3")
                    }
                }
                
                Section(header: Text("Account")) {
                    Button(action: {
                        // Action for Email
                    }) {
                        Text("Email")
                    }
                    Button(action: {
                        // Action for Password
                    }) {
                        Text("Password")
                    }
                    Button(action: {
                        // Action for Password
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                    
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(false))
    }
}
