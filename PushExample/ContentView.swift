//
//  ContentView.swift
//  PushExample
//
//  Created by Ryan Schumacher on 4/25/20.
//  Copyright © 2020 Schu Studios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var notiService = NotificationService.shared

    var body: some View {
        VStack {
            Button(action: {
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [.alert, .sound, .badge]) {
                    (granted, _) in
                }
            }) {
                Text("Request Permissions")
            }
            Text(notiService.deviceToken)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20.0, trailing: 0))

            Text("Incoming Push Notification")

            Text(notiService.pushNotification)
            .lineLimit(nil)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
