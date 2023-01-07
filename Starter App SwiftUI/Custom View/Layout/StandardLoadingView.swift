//
//  StandardLoadingView.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 04/01/23.
//

import SwiftUI

struct ActivityIndicator:UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .medium)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

struct StandardLoadingView: View {
    var body: some View {
        VStack(alignment: HorizontalAlignment.center){
            ActivityIndicator()
            Text("Loading...")
                .padding(.top, 10)
        }.background(Color.white)
    }
}

struct StandardLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        StandardLoadingView()
    }
}
