//
//  TransactionListTableViewCellTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/25/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest

@testable import Kumbara

class TransactionListTableViewCellTests: XCTestCase {
    
    func testSetupMoneyIn() {
        let nib = UINib(nibName: "TransactionListTableViewCell", bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! TransactionListTableViewCell
        
        cell.setup(with: Transaction(
            amount: "35",
            authorisationDate: Date(),
            description: "Iceland",
            location: Location(),
            postTransactionBalance: "",
            settlementDate: Date()
        ))
        
        XCTAssertNotNil(cell.title)
        XCTAssertEqual(cell.title.text, "Iceland")
        XCTAssertNotNil(cell.amount)
        XCTAssertEqual(cell.amount.text, "35 £")
        XCTAssertEqual(cell.moneyImageView.image, UIImage(named: "money-in"))
    }
    
    func testSetupMoneyOut() {
        let nib = UINib(nibName: "TransactionListTableViewCell", bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! TransactionListTableViewCell
        
        cell.setup(with: Transaction(
            amount: "-35",
            authorisationDate: Date(),
            description: "Iceland",
            location: Location(),
            postTransactionBalance: "",
            settlementDate: Date()
        ))
        
        XCTAssertNotNil(cell.title)
        XCTAssertEqual(cell.title.text, "Iceland")
        XCTAssertNotNil(cell.amount)
        XCTAssertEqual(cell.amount.text, "-35 £")
        XCTAssertEqual(cell.moneyImageView.image, UIImage(named: "money-out"))
    }
    
}
