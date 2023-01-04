//
//  QuranService.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 31/12/22.
//

import Foundation
import Alamofire

class QuranService{
    static let PATH_SURAT = "surat"
    func fetchSurah(completion: @escaping (Result<[SurahResponse], CustomException>)->Void){
        let request = AF.request(AppConstant.BASE_QURAN_URL+QuranService.PATH_SURAT, method: .get);
        request.responseDecodable(of: [SurahResponse].self, completionHandler: { result in
            if let data = result.value {
                completion(.success(data))
                return
            }
            print("masuk kesini")
            completion(.failure(result.response?.toCustomExtension() ?? CustomException()))
        })
    }
}
