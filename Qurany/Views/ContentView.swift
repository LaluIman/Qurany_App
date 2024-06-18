//
//  ContentView.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuranViewModel()
    @State private var searchTerm: String = ""
    
    //settingfont
    

    var body: some View {
        NavigationView{
           List{
               VStack {
                   Image("qq")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 370, height: 190)
               }
               ForEach(viewModel.surats.filter { surat in
                               let searchLowercased = searchTerm.lowercased()
                               let suratNamaLowercased = surat.namaLatin.lowercased()
                               return searchLowercased.isEmpty ? true : suratNamaLowercased.contains(searchLowercased)
                           }) { surat in
                               NavigationLink(destination: DetailView(surat: surat, viewModel: viewModel)) {
                                   HStack {
                                       ZStack {
                                           Image("qu")
                                               .resizable()
                                               .frame(width: 60, height: 60)
                                           Text("\(surat.id)")
                                               .font(.title2).bold()
                                       }
                                       Spacer()
                                       VStack(alignment: .trailing) {
                                           Text(surat.nama)
                                               .font(.custom("Amiri-Regular", size: 35))
                                               .foregroundColor(.purple)
                                               .padding(.bottom, 5)
                                           Text(surat.namaLatin)
                                               .font(.headline).bold()
                                               .foregroundColor(.black)
                                           Text(surat.arti)
                                               .font(.subheadline)
                                               .foregroundColor(.gray)
                                       }
                                   }
                                   .padding(.vertical, 10)
                                   .cornerRadius(8)
                               }
                           }
                       }
                        .scrollIndicators(.hidden)
                        .listStyle(.plain)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                NavigationLink(destination: SettingView()) {
                                    Image(systemName: "gear")
                                        .foregroundStyle(.purple)
                                }
                            }
                            ToolbarItem{
                                    HStack {
                                        TextField("Cari Surah", text: $searchTerm, onCommit:
                                            {
                                                viewModel.getSurats(searchTerm: searchTerm.lowercased())
                                            })
                                             
                                             .padding(.vertical, 8)
                                        Image(systemName: "magnifyingglass")
                                            .foregroundStyle(.gray)
                                    }
                            }
                        }
                   }
                   .onAppear {
                       viewModel.getSurats()
                   }
                   
                }
            }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

