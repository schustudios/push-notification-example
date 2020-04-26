//
//  AppDelegate.swift
//  PushExample
//
//  Created by Ryan Schumacher on 4/25/20.
//  Copyright © 2020 Schu Studios. All rights reserved.
//

import UIKit
import IntermediaryAppDelegate

@UIApplicationMain
class AppDelegate: RemoteNotificationIntermediaryAppDelegate, ConfigureSceneIntermediaryAppDelegate {

    override init() {
        super.init([SceneAppDelegate(),
                    NotificationService.shared])
    }
}
