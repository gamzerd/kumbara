//
//  TransactionDetailViewModel.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

class TransactionDetailViewModel: TransactionDetailViewModelProtocol {
    
    var transaction: Transaction
    
    init (transaction: Transaction) {
        self.transaction = transaction
    }
    
    func getTitle() -> String {
        return DateUtility.formatDate(date: self.transaction.authorisation_date, format:"EEEE, dd MMM, HH:mm")
    }
}
