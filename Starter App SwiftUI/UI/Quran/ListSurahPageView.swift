//
//  QuranPage.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 02/01/23.
//

import SwiftUI

struct ListSurahPageView: View {
    @EnvironmentObject var routeVm:RouteViewModel
    @StateObject var quranVm:QuranViewModel = QuranViewModel()
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center) {
            switch quranVm.listSurahState {
            case .IDLE: Spacer()
                    .frame(width: 0, height: 0)
            case .SUCCESS(let data): _SuccessView(surahs: data)
            case .FAILED(let exception): Text(exception.rawMessage ?? "")
            default: _LoadingView()
            }
        }.onAppear{
            quranVm.getSurahs()
        }.navigationBarTitle("Surah", displayMode: .large)
    }
}

struct _LoadingView:View {
    var body: some View {
        VStack(alignment: HorizontalAlignment.center) {
            Spacer()
            StandardLoadingView()
            Spacer()
        }
    }
}

struct _SuccessView:View {
    var surahs:[SurahResponse]
    var body: some View {
        List(surahs, id: \.id) { surah in
            _SurahView(surah: surah)
                .listRowInsets(EdgeInsets(
                    top: 2, leading: 0, bottom: 0, trailing: 1
                ))
        }.scrollContentBackground(.hidden)

    }
}

struct _SurahView:View {
    var surah:SurahResponse
    var body: some View {
        HStack(alignment: VerticalAlignment.top) {
            Text(String(surah.numberSurah ?? 0))
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .foregroundColor(.green)
            VStack(alignment: HorizontalAlignment.leading, spacing: 0) {
                Text((surah.place ?? "").uppercased())
                    .font(.system(size: 12))
                    .foregroundColor(.green)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 12)
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.green, lineWidth: 1))
                Text(surah.latinName ?? "")
                    .fontWeight(.bold)
                    .padding(.top, 5)
                Text(surah.mean ?? "")
                    .foregroundColor(Color.gray)
                    .padding(.top, 5)
            }
            Spacer()
            Text(surah.arabicName ?? "")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.green)
        }.padding(.vertical, 10)
    }
}

struct ListSurahPage_Previews: PreviewProvider {
    static var previews: some View {
//        _LoadingView()
        _SurahView(surah: SurahResponse(numberSurah: 1, arabicName: "Arabic", latinName: "Latin", totalAyah: 10, place: "Mekah", mean: "Arti", description: "Des", audioUrl: "Url"))
    }
}
