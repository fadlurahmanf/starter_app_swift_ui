//
//  InfoDialog.swift
//  Starter App SwiftUI
//
//  Created by Taufik Fadlurahman Fajari on 01/01/23.
//

import SwiftUI

struct InfoDialog: View {
    var title:String = "Info"
    var buttonText:String = "Okay"
    @Binding var isShow:Bool
    var onClick:(()->Void)?
    init(title: String, buttonText: String, isShow:Binding<Bool>, onClick: @escaping () -> Void
    ) {
        self.title = title
        self.buttonText = buttonText
        self._isShow = isShow
        self.onClick = onClick
    }
    
    init(title: String, buttonText: String, isShow:Binding<Bool>
    ) {
        self.title = title
        self.buttonText = buttonText
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
                InfoDialogContent(
                    title: title,
                    buttonText: buttonText,
                    isShow: $isShow,
                    onClick: onClick
                )
            }
        }
    }
}

struct InfoDialogContent:View {
    var title:String
    var buttonText:String
    @Binding var isShow:Bool
    var onClick:(()->Void)?
    
    var body: some View{
        VStack(alignment: HorizontalAlignment.center, spacing: 15){
            Text(title)
                .font(.title())
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            Text("Content")
                .font(.regular())
            CustomButton(
                text: buttonText,
                onClick:  onClick ?? {
                    isShow.toggle()
                }
            ).padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

//struct InfoDialogContent_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoDialogContent(
//            title: "tes", buttonText: "Okay",
//            isShow: Binding(projectedValue: false)
//        )
//    }
//}
