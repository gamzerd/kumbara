//
//  TransactionDetailViewModelTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/26/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest
@testable import Kumbara

class TransactionDetailViewModelTests: XCTestCase {

    func testInit() {
        
        // create the view model
        let vm = TransactionDetailViewModel(transaction: Transaction())
        
        // transaction should be initialised
        XCTAssertNotNil(vm.transaction)
    }
    
    func testGetTitle() {
        
        let format = "2014-08-09"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: format)
        
        // create the view model
        let vm = TransactionDetailViewModel(transaction: Transaction(authorisationDate: date!))
        
        // getTitle should return "Saturday, 09 Aug, 00:00"
        XCTAssertEqual(vm.getTitle(), "Saturday, 09 Aug, 00:00")
    }
    
}
