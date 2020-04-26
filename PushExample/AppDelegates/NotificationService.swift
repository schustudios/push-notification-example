//
//  NotificationService.swift
//  PushExample
//
//  Created by Ryan Schumacher on 4/25/20.
//  Copyright © 2020 Schu Studios. All rights reserved.
//

import UIKit
import Combine

class NotificationService: UIResponder, ObservableObject, UIApplicationDelegate {

    static let shared = NotificationService()
    private override init() { super.init() }

    @Published var deviceToken: String = ""
    @Published var pushNotification: String = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UIApplication.shared.registerForRemoteNotifications()

        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        let newToken = tokenParts.joined()

        self.deviceToken = newToken
        print("Did Register for Notifications with Device Token: \(self.deviceToken)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Did Fail to Register for Notification")
        self.deviceToken = ""
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        do {
            let data = try JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted)
            pushNotification = String(data: data, encoding: .utf8) ?? "Empty Data"
        } catch {
            print("Failed to parse notification with error: \(error.localizedDescription)")
        }

        completionHandler(.noData)
    }
}
