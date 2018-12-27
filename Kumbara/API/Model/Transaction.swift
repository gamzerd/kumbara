//
//  Transaction.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

// Transaction model
class Transaction: Codable {
    
    var amount: String = ""
    var authorisationDate: Date
    var description: String = ""
    var location: Location? = nil
    var postTransactionBalance: String = ""
    var settlementDate: Date
    
    init(amount: String = "",
         authorisationDate: Date = Date(),
         description: String = "",
         location: Location? = nil,
         postTransactionBalance: String = "",
         settlementDate: Date = Date())
    {
        self.amount = amount
        self.authorisationDate = authorisationDate
        self.description = description
        self.location = location
        self.postTransactionBalance = postTransactionBalance
        self.settlementDate = settlementDate
    }
    
    enum CodingKeys: String, CodingKey {
        case amount,
        authorisationDate = "authorisation_date",
        description,
        location,
        postTransactionBalance = "post_transaction_balance",
        settlementDate = "settlement_date"
    }
}
