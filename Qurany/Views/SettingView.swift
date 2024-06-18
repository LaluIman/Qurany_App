//
//  SettingView.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 18/06/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            NavigationLink(destination: FontSizeView()) {
                HStack {
                    Image(systemName: "textformat")
                        .font(.title3)
                        .foregroundStyle(.purple)
                    Text("Ukuran Teks")
                }
            }
            NavigationLink(destination: CreditsView()) {
                HStack {
                    Image(systemName: "info.circle")
                        .font(.title3)
                        .foregroundStyle(.purple)
                    Text("Credits")
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

