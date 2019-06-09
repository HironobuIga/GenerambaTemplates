//
//  RootRouter.swift
//  MVCSample
//
//  Created by HironobuIga on 2019/06/09.
//  Copyright © 2019 iganin. All rights reserved.
//

import Foundation
import UIKit

protocol RootRouterProtocol {
    static func makeModule() -> UIViewController
}

// MARK: - RootRouterProtocol
final class RootRouter: RootRouterProtocol {
    
    static func makeModule() -> UIViewController {
        let viewController = R.storyboard.rootViewController.instantiateInitialViewController()!
        viewController.router = RootRouter()
        
        return viewController
    }
    
}
