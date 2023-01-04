//
//  LoadingDialog.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 01/01/23.
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

struct LoadingDialog: View {
    @Binding var isShow:Bool
    
    init(isShow: Binding<Bool>) {
        self._isShow = isShow
    }
    
    var body: some View {
        ZStack{
            if(isShow){
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(isShow ? 0.5 : 0).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isShow.toggle()
                    }
                VStack(spacing: 10) {
                    ActivityIndicator()
                        .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                    Text("Loading...")
                        .font(.regular())
                        .padding(EdgeInsets(top: 0, leading: 100, bottom: 25, trailing: 100))
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding()
            }
        }
    }
}
