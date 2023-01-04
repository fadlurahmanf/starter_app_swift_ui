//
//  Starter_App_SwiftUIApp.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 31/12/22.
//

import SwiftUI

@main
struct Starter_App_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainDevView()
        }
    }
}

struct MainDevView:View{
    @ObservedObject var routeVm:RouteViewModel = RouteViewModel()
    
    var body: some View {
        NavigationStack(path: $routeVm.path) {
            if(routeVm.root == .splash){
                SplashPage()
            }else{
                ExamplePage()
            }
        }.environmentObject(routeVm)
    }
}
