//
//  AppDelegate.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 24/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: CityTabBarViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

