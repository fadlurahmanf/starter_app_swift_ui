//
//  QuranPage.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 02/01/23.
//

import SwiftUI

struct ListSurahPage: View {
    @EnvironmentObject var routeVm:RouteViewModel
    @ObservedObject var quranVm = QuranViewModel()
    
    init() {
        quranVm.getSurahs()
    }
    
    var body: some View {
        VStack {
            switch quranVm.listSurahState {
            case .IDLE: Text("idle woi")
            case .SUCCESS(_): Text("success nih")
            case .FAILED(_): Text("gagal nih")
            default: Text("loading default nih")
            }
//            if(quranVm.listSurahState == .SUCCESS(data)){
//                print("masuk success \(data)")
//            }else{
//                print("masuk salah")
//            }
        }
    }
}

struct ListSurahPage_Previews: PreviewProvider {
    static var previews: some View {
        ListSurahPage()
    }
}
