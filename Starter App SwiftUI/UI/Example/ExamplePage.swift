//
//  ContentView.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 31/12/22.
//

import SwiftUI

struct ExamplePage: View {
    @State private var showInfoDialog: Bool = false
    @State private var showLoadingDialog: Bool = false
    @State private var selection:Int? = nil
    @EnvironmentObject var routeVm:RouteViewModel
    
    var body: some View {
        ZStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Custom Info Dialog")
                CustomButton(
                    text: "Open Dialog", onClick: {
                        showInfoDialog.toggle()
                    }
                )
                Text("Custom Loading Dialog")
                CustomButton(
                    text: "Open Loading Dialog",
                    onClick: {
                        showLoadingDialog.toggle()
                    }
                )
                Text("Navigation")
                CustomButton(
                    text: "Navigation",
                    onClick: {
                        routeVm.path.append(.splash)
                    }
                )
                CustomButton(text: "Fetch API"){
                    routeVm.path.append(.listSurah)
//                    let quranService = QuranService()
//                    quranService.fetchSurah(){ (result:Result<[SurahResponse], CustomException>) in
//                        switch result {
//                        case .success(_):
//                            print("")
//                        case .failure(_):
//                            print("")
//                        }
//                    }
                }
            }.padding()
            
            InfoDialog(
                title: "Info",
                buttonText: "Okay",
                isShow: $showInfoDialog
            )
            
            LoadingDialog(isShow: $showLoadingDialog)
        }.navigationDestination(for: AppRoute.self){ route in
            switch route {
            case .listSurah:
                ListSurahPage()
            case .splash:
                SplashPage()
            default:
                EmptyView()
            }
        }
    }
}

struct ExamplePage_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePage()
    }
}
