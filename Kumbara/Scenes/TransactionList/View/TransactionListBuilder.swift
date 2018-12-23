//
//  TransactionListBuilder.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

final class TransactionListBuilder {
    
    static func make() -> TransactionListViewController {
        
        let viewModel = TransactionListViewModel(dataSource: app.dataSource)
        let viewController = TransactionListViewController(viewModel: viewModel)
        return viewController
        
    }
}
