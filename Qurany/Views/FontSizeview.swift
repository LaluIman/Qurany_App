//
//  FontSizeview.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 18/06/24.
//

import SwiftUI

struct FontSizeView: View {
    @AppStorage("arabicFontSize") private var arabicFontSize: Double = 30
    @AppStorage("latinFontSize") private var latinFontSize: Double = 18
    @AppStorage("translationFontSize") private var translationFontSize: Double = 15
    
    private let defaultArabicFontSize: Double = 30
    private let defaultLatinFontSize: Double = 18
    private let defaultTranslationFontSize: Double = 15

    @State private var showingAlert = false

    var body: some View {
        VStack {
            Text("Atur ukuran teks")
                .font(.headline)
                .padding(.bottom, 20)
            
            
            VStack(alignment: .trailing){
                
                Divider()
                
                Text("بِسْمِ اللهِ الرَّحْمَنِ الرَّحِيْمِ")
                    .font(.custom("Amiri-Regular", size: CGFloat(arabicFontSize)))
                    .foregroundStyle(.purple)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.trailing)
                
                Text("Bismillaahirrahmaanirrahiim")
                    .font(.system(size: CGFloat(latinFontSize)))
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.trailing)
                
                Text("'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang'")
                    .font(.system(size: CGFloat(translationFontSize)))
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.trailing)
                
                Divider()
            }
            .frame(height: 200, alignment: .top)
          
            
            Group {
                HStack {
                    Text("Ukuran bahasa arab:")
                        .font(.subheadline)
                    
                    Text("\(Int(arabicFontSize))")
                        .font(.subheadline).bold()
                }
                Slider(value: $arabicFontSize, in: 10...50, step: 1)
                    .padding(.horizontal)
            }
            
            Group {
                HStack {
                    Text("Ukuran latin:")
                        .font(.subheadline)
                    
                    Text("\(Int(latinFontSize))")
                        .font(.subheadline).bold()
                }
                Slider(value: $latinFontSize, in: 10...30, step: 1)
                    .padding(.horizontal)
            }
            
            Group {
                HStack {
                    Text("Ukuran translasi:")
                        .font(.subheadline)
                    
                    Text("\(Int(translationFontSize))")
                        .font(.subheadline).bold()
                }
                Slider(value: $translationFontSize, in: 10...20, step: 1)
                    .padding(.horizontal)
            }
            
            Button(action: { showingAlert = true }) {
                   Text("Reset to Default")
                       .padding()
                       .foregroundColor(.blue)
                       .cornerRadius(8)
               }
            .padding(.top, 40)
            .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Reset to Default"),
                        message: Text("Are you sure you want to reset the font sizes to their default values?"),
                        primaryButton: .destructive(Text("Reset")) {
                            resetToDefault()
                        },
                        secondaryButton: .cancel()
                    )
                }
            
            Spacer()
        }
        .padding()
    }
    
    private func resetToDefault() {
           arabicFontSize = defaultArabicFontSize
           latinFontSize = defaultLatinFontSize
           translationFontSize = defaultTranslationFontSize
       }
}

struct FontSizeView_Previews: PreviewProvider {
    static var previews: some View {
        FontSizeView()
    }
}
