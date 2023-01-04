//
//  SplashPage.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 01/01/23.
//

import SwiftUI

struct SplashPage: View {
    @EnvironmentObject private var routeVm:RouteViewModel
    
    var body: some View {
        VStack {
            Button(
                action: {
                    routeVm.root = .example
                }
            ){
                Text("SPLASH")
            }
            
        }
    }
}

struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}
