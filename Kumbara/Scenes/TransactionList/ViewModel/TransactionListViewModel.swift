//
//  TransactionListViewModel.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

final class TransactionListViewModel: TransactionListViewModelProtocol {
   
    var sections = [DaySection]()
    
    weak var viewDelegate: TransactionListViewProtocol?
    
    private let dataSource: DataSourceProtocol
    
    init (dataSource: DataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    /**
     * Called when title get.
     */
    func getTitle() -> String {
        return "Kumbara"
    }
    
    /**
     * Called when a row of the transaction list is selected.
     * @param indexSection: index of the selected section.
     * @param indexRow: index of the selected row.
     */
    func didRowSelect(indexSection: Int, indexRow: Int) {
        viewDelegate?.openPage(transaction: sections[indexSection].transactions[indexRow])
    }
    
    /**
     * Called when page is loaded.
     */
    func load() {
        dataSource.getTransactions(callback: didReceiveTransactions(list:error:))
    }
    
    /**
     * Called when a transaction list is received.
     * @param list: list of transaction.
     * @param error: error if service fails.
     */
    func didReceiveTransactions(list: Array<Transaction>?, error: Error?) {
        
        if let list = list {
            
            let groups = Dictionary(grouping: list) { (transaction) -> Date in
                return transaction.authorisationDate.getDay()
            }
            
            self.sections = groups.map(DaySection.init(day:transactions:)).sorted(by: {
                $0.day.compare($1.day) == .orderedDescending
            })
            
            viewDelegate?.showList()
        }
        
        if error != nil {
            viewDelegate?.showError(message: "Fetching list failed!")
        }
    }
    
    /**
     * Called when cell pressed long.
     * @param indexSection: index of the selected section.
     * @param indexRow: index of the selected row.
     * @return TransactionDetailViewController: controller to show
     */
    func didPressLong(indexSection: Int, indexRow: Int) -> TransactionDetailViewController {
      
        let detailViewModel = TransactionDetailViewModel(transaction: sections[indexSection].transactions[indexRow])
        return TransactionDetailBuilder.make(with: detailViewModel)
    }
    
}

struct DaySection {
    
    var day: Date
    var transactions: [Transaction]
    
}
