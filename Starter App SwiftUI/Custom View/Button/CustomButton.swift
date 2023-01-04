//
//  CustomButton.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 31/12/22.
//

import SwiftUI

struct CustomButton:View {
    var btnText:String = ""
    var action:()->Void = {}
    init(text:String = "Button Text", onClick: @escaping ()->Void) {
        btnText = text
        action = onClick
    }
    var body: some View{
        Button(
            action: action,
            label: {
                Text(btnText)
                    .font(.button())
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        )
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(5)
    }
}

struct CustomButton_Preview:PreviewProvider{
    static var previews: some View{
        CustomButton(
            text: "TES TES",
            onClick: {
                
            }
        )
    }
}
