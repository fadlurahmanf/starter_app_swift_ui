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
    
    func schedulNotification() {
        let center =  UNUserNotificationCenter.current()
                
                let content = UNMutableNotificationContent()
                content.interruptionLevel = .timeSensitive
                content.body = "Tes body"
                content.subtitle = "Isi Sub Title"
                content.categoryIdentifier = "Task Actions"
                content.sound = UNNotificationSound.default
                        
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                let markAsCompleted = UNNotificationAction(identifier: "MARK_AS_COMPLETED", title: "Mark as Completed", options: .foreground)
                
                let placeholder = "Task"
                let category = UNNotificationCategory(identifier: "Task Actions", actions: [markAsCompleted], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: placeholder) // // Same Identifier in schedulNotification()
                
                center.setNotificationCategories([category])
                
                center.add(request)
            }
    
    var body: some View {
        ZStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Group {
                    Text("Ask User Notification")
                    CustomButton(
                        text: "Tes permission",
                        onClick: {
                            let center = UNUserNotificationCenter.current()
                            center.requestAuthorization( options: [.alert, .badge, .sound]){ success, error in
                                print("masuk success \(success)")
                                print("masuk error \(error)")
                            }
                        }
                    )
                }
                Text("Simple Notification")
                CustomButton(
                    text: "Show Simple Notification",
                    onClick: {
                        self.schedulNotification()
//                        let center = UNUserNotificationCenter.current()
//                        let content = UNMutableNotificationContent()
//                        content.title = "Hot Notification"
//                        content.body = "Thanks for using my apps"
//
//                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
//
//                        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
//
//                        let dismiss = UNNotificationAction(identifier: "DISMISS", title: "Dismiss", options: [])
//
//                        let category = UNNotificationCategory(identifier: "General", actions: [dismiss], intentIdentifiers: [], options: [])
//
//                        center.setNotificationCategories([category])
//
//                        center.add(request){ error in
//                            print("masuk notif harusnya")
//                            if let error = error {
//                                print("masuk error \(error)")
//                            }
//                        }
                    }
                )
                Text("Custom Info Dialog")
                CustomButton(
                    text: "Open Dialog", onClick: {
                        showInfoDialog.toggle()
                    }
                )
                Group {
                    Text("Custom Loading Dialog")
                    CustomButton(
                        text: "Open Loading Dialog",
                        onClick: {
                            showLoadingDialog.toggle()
                        }
                    )
                    Text("List Surah")
                    CustomButton(
                        text: "List Surah",
                        onClick: {
                            routeVm.path.append(.listSurah)
                        }
                    )
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
                ListSurahPageView()
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
