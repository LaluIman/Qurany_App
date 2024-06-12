//
//  DetailView.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 12/06/24.
//

import SwiftUI

struct DetailView: View {
    var surat: Surat
    @ObservedObject var viewModel: QuranViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.ayats) { ayat in
                HStack {
                    VStack(alignment: .trailing, spacing: 15) {
                        Text(ayat.ar)
                            .font(.custom("Amiri", size: 30))
                            .lineSpacing(15)
                            .foregroundColor(.purple)
                            .multilineTextAlignment(.trailing)
                            
                        Text(ayat.tr)
                            .font(.headline)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                            
                        
                        Text(ayat.idn)
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                        
                        Divider()
                    }
                    .frame(width: 370,alignment: .trailing)
                }
                .listRowSeparator(.hidden)
                
            }
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .onAppear {
            viewModel.getDetailSurat(id: surat.id)
        }
        .navigationTitle(surat.namaLatin)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            surat: Surat(id: 1, nama: "الفاتحة", namaLatin: "Al-Fatihah", jumlahAyat: 7, arti: "Pembukaan"),
            viewModel: QuranViewModel()
        )
    }
}

