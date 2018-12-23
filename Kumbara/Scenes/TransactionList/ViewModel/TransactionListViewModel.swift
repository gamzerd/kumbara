//
//  TransactionListViewModel.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

final class TransactionListViewModel: TransactionListViewModelProtocol {
    
    var view: TransactionListViewProtocol?
    var sections = [DaySection]()
    
    private let dataSource: DataSourceProtocol
    
    init (dataSource: DataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getTitle() -> String {
        return "Kumbara"
    }
    
    /**
     * Called when page is loaded.
     */
    func load() {
        self.dataSource.getTransactions(callback: self.didReceiveTransactions(list:error:))
    }
    
    /**
     * Called when a transaction list is received.
     * @param list: list of transaction.
     * @param error: error if service fails.
     */
    func didReceiveTransactions(list: Array<Transaction>?, error: Error?) {
        
        if let list = list {
            
            let groups = Dictionary(grouping: list) { (transaction) -> Date in
                return self.getDay(date: transaction.authorisation_date)
            }
            
            self.sections = groups.map(DaySection.init(day:transactions:)).sorted(by: {
                $0.day.compare($1.day) == .orderedDescending
            })
            
            self.view!.showList()
        }
        
        if error != nil {
            self.view!.showError(message: "Fetching list failed!")
        }
    }
    
    func getDay(date: Date) -> Date {
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = 0
        dateComponents.minute = 0
        
        return calendar.date(from: dateComponents) ?? Date()
    }
}

struct DaySection {
    
    var day: Date
    var transactions: [Transaction]
    
}