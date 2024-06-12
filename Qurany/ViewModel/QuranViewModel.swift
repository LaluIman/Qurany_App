//
//  QuranViewModel.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 12/06/24.
//

import Foundation
import Combine

class QuranViewModel: ObservableObject {
    @Published var surats: [Surat] = []
    @Published var ayats: [Ayat] = []
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let service = QuranService()
    
    func getSurats(searchTerm: String? = nil) {
        isLoading = true
        service.fetchSurat(searchTerm: searchTerm)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("Error fetching surats: \(error)")
                }
            }, receiveValue: { surats in
                self.surats = surats
            })
            .store(in: &cancellables)
    }


    
    func getDetailSurat(id: Int) {
        isLoading = true
        service.fetchDetailSurat(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("Error fetching detail surat: \(error)")
                }
            }, receiveValue: { ayats in
                self.ayats = ayats
            })
            .store(in: &cancellables)
    }
}


