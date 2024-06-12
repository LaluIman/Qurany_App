//
//  Surat.swift
//  Qurany
//
//  Created by Lalu Iman Abdullah on 12/06/24.
//

import Foundation

struct Surat: Identifiable, Decodable {
    let id: Int
    let nama: String
    let namaLatin: String
    let jumlahAyat: Int
    let arti: String
    
    enum CodingKeys: String, CodingKey {
        case id = "nomor"
        case nama
        case namaLatin = "nama_latin"
        case jumlahAyat = "jumlah_ayat"
        case arti
    }
}

struct Ayat: Identifiable, Decodable {
    let id: Int
    let surah: Int
    let nomor: Int
    let ar: String
    let tr: String
    let idn: String
}
