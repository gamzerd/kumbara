//
//  TransactionDetailViewModel.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

final class TransactionDetailViewModel: TransactionDetailViewModelProtocol {
    
    var transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
    
    /**
     * Called to get title.
     */
    func getTitle() -> String {
        
        return self.transaction.authorisationDate.formatDate(format: "EEEE, dd MMM, HH:mm")
    }
}
