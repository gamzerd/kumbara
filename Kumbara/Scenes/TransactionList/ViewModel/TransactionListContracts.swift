//
//  TransactionListContracts.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation
import UIKit

protocol TransactionListViewModelProtocol: class {
    
    var viewDelegate: TransactionListViewProtocol? { get set }
    
    var sections: [DaySection] { get set }
    
    func load()
    
    func getTitle() -> String
    
    func didRowSelect(indexSection: Int, indexRow: Int)
    
    func didPressLong(indexSection: Int, indexRow: Int) -> UIViewController
}

protocol TransactionListViewProtocol: class {
    
    func showList()
    
    func showError(message: String)
    
    func openPage(transaction: Transaction)
}

