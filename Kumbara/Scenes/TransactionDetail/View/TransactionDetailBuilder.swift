//
//  TransactionDetailBuilder.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

final class TransactionDetailBuilder {
    
    static func make(with viewModel: TransactionDetailViewModelProtocol) -> TransactionDetailViewController {
        let viewController = TransactionDetailViewController(viewModel: viewModel)
        return viewController
    }
}
