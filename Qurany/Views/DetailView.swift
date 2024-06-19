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
    @Environment(\.presentationMode) var presentationMode
    
       @AppStorage("arabicFontSize") private var arabicFontSize: Double = 30
       @AppStorage("latinFontSize") private var latinFontSize: Double = 18
       @AppStorage("translationFontSize") private var translationFontSize: Double = 15

    
    var body: some View {
        NavigationView{
            List {
                ZStack {
                    Image("bis")
                        .resizable()
                        .frame(width: 370, height: 300)
                        .padding(.bottom)
                    Text(surat.namaLatin)
                        .font(.largeTitle).bold()
                        .foregroundStyle(.white)
                        .frame(height: 200, alignment: .top)
                }
                ForEach(viewModel.ayats) { ayat in
                    HStack {
                        VStack(alignment: .trailing, spacing: 15) {
                            Text(ayat.ar)
                                .font(.custom("Amiri-Regular", size: CGFloat(arabicFontSize)))
                                .lineSpacing(15)
                                .foregroundColor(.purple)
                                .multilineTextAlignment(.trailing)
                            
                            Text(ayat.tr)
                                .font(.system(size: CGFloat(latinFontSize)))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.trailing)
                            
                            
                            Text(ayat.idn)
                                .font(.system(size: CGFloat(translationFontSize)))
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .font(.title3)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Spacer()
                        Text(surat.namaLatin)
                            .font(.title2).bold()
                            .foregroundColor(.purple)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
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

