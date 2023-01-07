//
//  SurahResponse.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 31/12/22.
//

import Foundation

struct SurahResponse:Decodable,Identifiable{
    var id = UUID()
    let numberSurah:Int?
    let arabicName:String?
    let latinName:String?
    let totalAyah:Int?
    let place:String?
    let mean:String?
    let description:String?
    let audioUrl:String?
    
    private enum CodingKeys:String, CodingKey{
        case numberSurah = "nomor"
        case arabicName = "nama"
        case latinName = "nama_latin"
        case totalAyah = "jumlah_ayat"
        case place = "tempat_turun"
        case mean = "arti"
        case description = "deskripsi"
        case audioUrl = "audio"
    }
}
