//
//  TransactionDetailTableViewCellTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/25/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest
@testable import Kumbara

class TransactionDetailTableViewCellTests: XCTestCase {
    
    func testSetupWithLocation() {
        let nib = UINib(nibName: "TransactionDetailTableViewCell", bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! TransactionDetailTableViewCell
        
        cell.setup(with: Transaction(
                amount: "",
                authorisationDate: Date(),
                description: "Iceland",
                location: Location(latitude: "51.5855", longitude: "-0.98484"),
                postTransactionBalance: "44",
                settlementDate: Date()
        ))
        
        // should show correct info
        XCTAssertNotNil(cell.descriptionLabel)
        XCTAssertEqual(cell.descriptionLabel.text, "Iceland")
        XCTAssertNotNil(cell.balanceLabel)
        XCTAssertEqual(cell.balanceLabel.text, "Balance: 44 £")
        
        // if there is a location info, emptyLocationLabel should be hidden
        XCTAssertTrue(cell.emptyLocationLabel.isHidden)
        
        // if there is a location info, mapView should not be hidden
        XCTAssertFalse(cell.mapView.isHidden)
    }
    
    func testSetupWithoutLocation() {
        let nib = UINib(nibName: "TransactionDetailTableViewCell", bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! TransactionDetailTableViewCell
        
        cell.setup(with: Transaction(
            amount: "",
            authorisationDate: Date(),
            description: "Iceland",
            location: nil,
            postTransactionBalance: "44",
            settlementDate: Date()
        ))
        
        XCTAssertNotNil(cell.descriptionLabel)
        XCTAssertEqual(cell.descriptionLabel.text, "Iceland")
        XCTAssertNotNil(cell.balanceLabel)
        XCTAssertEqual(cell.balanceLabel.text, "Balance: 44 £")
        
        // if there is not a location info, emptyLocationLabel should not be hidden
        XCTAssertFalse(cell.emptyLocationLabel.isHidden)
        
        // if there is not a location info, mapView should be hidden
        XCTAssertTrue(cell.mapView.isHidden)
    }
    
}
