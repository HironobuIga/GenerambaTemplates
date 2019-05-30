//
//  AppDelegate.swift
//  GenerambaTemplates
//
//  Created by HironobuIga on 2019/05/29.
//  Copyright © 2019 iganin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = RootViewController.insntantiate()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

