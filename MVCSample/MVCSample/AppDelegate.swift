//
//  AppDelegate.swift
//  MVCSample
//
//  Created by HironobuIga on 2019/06/09.
//  Copyright © 2019 iganin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = RootRouter.makeModule()
        window?.makeKeyAndVisible()
        
        return true
    }

}

