//
//  RouteViewModel.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 01/01/23.
//

import Foundation

enum AppRoute:Hashable{
    case splash
    case example
    case listSurah
}

class RouteViewModel:ObservableObject{
    @Published var path = [AppRoute]()
    @Published var root:AppRoute = .splash
}
