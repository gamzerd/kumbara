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
    
    /*{
    "amount":                       "-3.95",
    "authorisation_date":           "2016-01-21T12:43:29+00:00",
    "description":                  "Marks & Spencer",
    "location":                     {
    "latitude":     "51.505530",
    "longitude":    "-0.098169"
    },
    "post_transaction_balance":     "14.54",
    "settlement_date":              "2016-01-22T10:48:21+00:00"
    }*/
    
    var amount: String = ""
    var authorisation_date: Date
    var description: String = ""
    var location: Location?
    var post_transaction_balance: String = ""
    var settlement_date: Date
    
    init(amount: String,
         authorisation_date: Date,
         description: String,
         location: Location,
         post_transaction_balance: String,
         settlement_date: Date)
    {
        self.amount = amount
        self.authorisation_date = authorisation_date
        self.description = description
        self.location = location
        self.post_transaction_balance = post_transaction_balance
        self.settlement_date = settlement_date
    }
    
}
