//
//  AppDelegate.swift
//  iDoc
//
//  Created by Default User on 4/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            window.rootViewController = PersonalCabinetViewController()
            window.makeKeyAndVisible()
        }
            return true
        }
}

