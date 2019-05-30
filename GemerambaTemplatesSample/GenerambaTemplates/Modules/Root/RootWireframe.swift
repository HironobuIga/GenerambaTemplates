//
//  RootWireframe.swift
//  GenerambaTemplates
//
//  Created by iganin on 30/05/2019.
//  Copyright © 2019 iganin. All rights reserved.
//

import UIKit

protocol RootWireframe {

}

final class DefaultRootWireframe: RootWireframe {

    private weak var viewController: UIViewController! // weak

    init(on viewController: UIViewController) {
        self.viewController = viewController
    }
}
