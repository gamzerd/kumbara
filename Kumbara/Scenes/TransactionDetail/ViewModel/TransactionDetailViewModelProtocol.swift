//
//  TransactionDetailViewModelProtocol.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

protocol TransactionDetailViewModelProtocol {
    
    var transaction: Transaction { get set }
    
    func getTitle() -> String

}
