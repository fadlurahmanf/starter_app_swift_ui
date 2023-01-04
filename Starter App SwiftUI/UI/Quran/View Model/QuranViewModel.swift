//
//  QuranViewModel.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 02/01/23.
//

import Foundation

class QuranViewModel:ObservableObject{
    private let service = QuranService()
    @Published var listSurahState:NetworkState<[SurahResponse]> = NetworkState.IDLE
    
    func getSurahs(){
        self.listSurahState = .IDLE
        self.listSurahState = .LOADING
        service.fetchSurah(){ (result:Result<[SurahResponse], CustomException>) in
            switch result {
            case .success(let surahs):
                self.listSurahState = .SUCCESS(surahs)
            case .failure(let exception):
                self.listSurahState = .FAILED(exception)
            }
        }
    }
}
