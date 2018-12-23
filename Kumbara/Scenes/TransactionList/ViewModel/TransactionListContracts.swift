//
//  TransactionListContracts.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

protocol TransactionListViewModelProtocol {
        
    var sections: [DaySection] { get set }
    
    var view: TransactionListViewProtocol? { get set }
    
    func load()
    
    func getTitle() -> String

    func didRowSelect(indexSection: Int, indexRow: Int)

}

protocol TransactionListViewProtocol {
    
    func showList()
    
    func showError(message: String)
    
    func openPage(transaction: Transaction)

}

