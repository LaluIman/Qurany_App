//
// CreditsView.swift
// Qurany
//
//  Created by Lalu Iman Abdullah on 18/06/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Credits")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.purple)
                    HStack(alignment: .top) {
                        Image(systemName: "lightbulb")
                            .font(.title)
                            .foregroundStyle(.purple)
                        Text("Thanks to [equran.id](https://equran.id/surat/1) for the API, without it I could not make this app 🫶 ")
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person.fill")
                                .font(.title)
                                .foregroundStyle(.purple)
                            Text("The developer: [Lalu Iman Abdullah](https://laluiman.vercel.app)")
                        }
                    }
                    Divider()
                }
                .padding()
            }
        }
    }
}

#Preview {
    CreditsView()
}
