//
//  AppRouter.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

final class  AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    /**
     * Sets rootViewController.
     */
    func start() {
        let viewController = TransactionListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
