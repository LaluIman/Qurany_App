//
//  QuranService.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 12/06/24.
//

import Foundation
import Combine

class QuranService {
    func fetchSurat(searchTerm: String? = nil) -> AnyPublisher<[Surat], Error> {
        var urlComponents = URLComponents(string: "https://equran.id/api/surat")!
        if let searchTerm = searchTerm {
            urlComponents.queryItems = [URLQueryItem(name: "search", value: searchTerm)]
        }
        guard let url = urlComponents.url else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Surat].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    
    func fetchDetailSurat(id: Int) -> AnyPublisher<[Ayat], Error> {
        let url = URL(string: "https://equran.id/api/surat/\(id)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: DetailSuratResponse.self, decoder: JSONDecoder())
            .map { $0.ayat }
            .eraseToAnyPublisher()
    }
}

struct DetailSuratResponse: Decodable {
    let ayat: [Ayat]
}


