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

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.surats.filter { surat in
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
                                    .foregroundStyle(.purple)
                            }
                            
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text(surat.nama)
                                    .font(.custom("Amiri-Regular", size: 35))
                                    .foregroundColor(.purple)
                                    .padding(.bottom,5)
                                Text(surat.namaLatin)
                                    .font(.headline).bold()
                                    .foregroundColor(.black)
                                Text(surat.arti)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    viewModel.getSurats()
                }
            .navigationBarItems(leading:
                Text("Al-Quran")
                .font(.title).bold()
                ,
                trailing:
                HStack {
                    TextField("Cari Surah", text: $searchTerm, onCommit: {
                                    viewModel.getSurats(searchTerm: searchTerm.lowercased())
                                })
                            .padding(.vertical, 8)
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                }
            )
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

