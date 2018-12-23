//
//  AppRouter.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

final class AppRouter {
    
    private let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    /**
     * Sets rootViewController.
     */
    func start() {
        let viewController = TransactionListBuilder.make()
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

protocol ShowDetailsCoordinatorDelegate: class {
    func showDetails(transaction: Transaction, fromViewController: UIViewController)
}

extension AppRouter: ShowDetailsCoordinatorDelegate {
    
    /**
     * Shows details of transaction list.
     * @param transaction: Object to set details, fromViewController: controller to show detail
     */
    func showDetails(transaction: Transaction, fromViewController: UIViewController) {
        let viewModel = TransactionDetailViewModel(transaction: transaction)
        let transactionDetailVC = TransactionDetailBuilder.make(with: viewModel)
        fromViewController.show(transactionDetailVC, sender: nil)
    }
}
