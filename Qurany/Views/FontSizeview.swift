//
//  FontSizeview.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 18/06/24.
//

import SwiftUI

struct FontSizeView: View {
    @AppStorage("arabicFontSize") private var arabicFontSize: Double = 24
    @AppStorage("latinFontSize") private var latinFontSize: Double = 18
    @AppStorage("translationFontSize") private var translationFontSize: Double = 16

    var body: some View {
        VStack {
            Text("Adjust Font Sizes")
                .font(.headline)
                .padding(.bottom, 20)
            
            Group {
                Text("Arabic Font Size")
                    .font(.subheadline)
                Slider(value: $arabicFontSize, in: 10...50, step: 1)
                    .padding(.horizontal)
                Text("بِسْمِ اللهِ الرَّحْمَنِ الرَّحِيْمِ")
                    .font(.custom("Amiri-Regular", size: CGFloat(arabicFontSize)))
                    .padding(.bottom, 20)
            }
            
            Group {
                Text("Latin Font Size")
                    .font(.subheadline)
                Slider(value: $latinFontSize, in: 10...30, step: 1)
                    .padding(.horizontal)
                Text("Sample Latin Text")
                    .font(.system(size: CGFloat(latinFontSize)))
                    .padding(.bottom, 20)
            }
            
            Group {
                Text("Translation Font Size")
                    .font(.subheadline)
                Slider(value: $translationFontSize, in: 10...20, step: 1)
                    .padding(.horizontal)
                Text("Sample Translation Text")
                    .font(.system(size: CGFloat(translationFontSize)))
                    .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Font Size")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FontSizeView_Previews: PreviewProvider {
    static var previews: some View {
        FontSizeView()
    }
}
