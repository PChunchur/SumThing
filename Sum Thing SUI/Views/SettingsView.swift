//
//  SettingsView.swift
//  Sum Thing SUI
//
//  Created by Swayam on 30/06/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Feedback")) {
                Button("Provide Feedback") {
                    //Implement feedback submission logic
                }
            }
            Section(header: Text("About")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
