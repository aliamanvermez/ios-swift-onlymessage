//
//  AppDelegate.swift
//  OnlyMessage
//
//  Created by Ali Amanvermez on 19.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureWindow(destinationVC: OMLoginViewController())
        return true
    }
    
    func configureWindow(destinationVC: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        window?.rootViewController = destinationVC
    }






}

