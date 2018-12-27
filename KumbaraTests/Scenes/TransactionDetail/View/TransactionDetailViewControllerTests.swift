//
//  TransactionDetailViewControllerTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/26/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest
@testable import Kumbara

class TransactionDetailViewControllerTests: XCTestCase {

    func testViewDidLoad() {
        
        let viewModel = MockDetailViewModel()
        let viewController = TransactionDetailViewController(viewModel: viewModel)
        
        // needed for triggering viewDidLoad function
        _ = viewController.view
        
        XCTAssertNotNil(viewController.tableView)
    }
    
    func testPageTitle() {
        
        let viewModel = MockDetailViewModel()
        let viewController = TransactionDetailViewController(viewModel: viewModel)
        _ = viewController.view
        
        XCTAssertEqual(viewController.title, "Kumbara Detail Test Header")
    }
    
    func testRenderTransaction() {
        
        let viewModel = MockDetailViewModel()
        let viewController = TransactionDetailViewController(viewModel: viewModel)
        _ = viewController.view
        
        viewModel.transaction = Transaction(
            amount: "",
            authorisationDate: Date(),
            description: "Iceland",
            location: Location(latitude: "51.5855", longitude: "-0.98484"),
            postTransactionBalance: "44",
            settlementDate: Date()
        )
        
        XCTAssertEqual(viewController.tableView.numberOfSections(), 1)
        XCTAssertEqual(viewController.tableView.numberOfItemsInSection(sectionIndex: 0), 1)
    }
    
    func testRenderTransactionDetailCell() {
        
        let viewModel = MockDetailViewModel()
        let viewController = TransactionDetailViewController(viewModel: viewModel)
        _ = viewController.view
        
        viewModel.transaction = Transaction(
            amount: "",
            authorisationDate: Date(),
            description: "Iceland",
            location: Location(latitude: "51.5855", longitude: "-0.98484"),
            postTransactionBalance: "44",
            settlementDate: Date()
        )
        
        XCTAssertEqual(viewController.tableView.balanceText(sectionIndex: 0, rowIndex: 0), "Balance: 44 £")
        XCTAssertEqual(viewController.tableView.descriptionText(sectionIndex: 0, rowIndex: 0), "Iceland")
    }
    
}

private extension UITableView {
   
    func numberOfItemsInSection(sectionIndex: Int) -> Int {
        return numberOfRows(inSection: sectionIndex)
    }
    
    func numberOfSections() -> Int {
        return numberOfSections
    }
    
    func cell(sectionIndex: Int, rowIndex: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: rowIndex, section: sectionIndex))
    }
    
    func balanceText(sectionIndex: Int, rowIndex: Int) -> String? {
        let detailCell = cell(sectionIndex: sectionIndex, rowIndex: rowIndex) as! TransactionDetailTableViewCell
        return detailCell.balanceLabel.text
    }
    
    func descriptionText(sectionIndex: Int, rowIndex: Int) -> String? {
        let detailCell = cell(sectionIndex: sectionIndex, rowIndex: rowIndex) as! TransactionDetailTableViewCell
        return detailCell.descriptionLabel.text
    }    
}

class MockDetailViewModel: TransactionDetailViewModelProtocol {
    
    var transaction = Transaction()
    
    func getTitle() -> String {
        return "Kumbara Detail Test Header"
    }
    
    
}
