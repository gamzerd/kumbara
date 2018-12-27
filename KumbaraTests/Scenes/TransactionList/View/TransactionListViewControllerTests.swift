//
//  TransactionListViewControllerTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/25/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest
@testable import Kumbara

class TransactionListViewControllerTests: XCTestCase {
    
    func testViewDidLoad() {
        
        let viewModel = MockViewModel()
        let viewController = TransactionListViewController(viewModel: viewModel)
        
        // needed for triggering viewDidLoad function
        _ = viewController.view
        
        XCTAssertNotNil(viewController.tableView)
    }
    
    func testPageTitle() {
        
        let viewModel = MockViewModel()
        let viewController = TransactionListViewController(viewModel: viewModel)
        _ = viewController.view
        
        XCTAssertEqual(viewController.title, "Kumbara Test Header")
    }
    
    func testLoadFuncCall() {
        
        let viewModel = MockViewModel()
        let viewController = TransactionListViewController(viewModel: viewModel)
        _ = viewController.view
        
        XCTAssertEqual(viewModel.loadCount, 1)
    }
    
    func testRenderWithoutTransactions() {
        
        let viewModel = MockViewModel()
        let viewController = TransactionListViewController(viewModel: viewModel)
        _ = viewController.view
        
        XCTAssertEqual(viewController.tableView.numberOfSections(), 0)
    }
    
    func testRenderTransactions() {
        
        let viewModel = MockViewModel()
        viewModel.sections = [
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Argos"), Transaction(description: "Vapiano")]
            ),
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Vegan")]
            )
        ]
        
        let viewController = TransactionListViewController(viewModel: viewModel)
        _ = viewController.view
        
        // tableView should have 2 sections
        XCTAssertEqual(viewController.tableView.numberOfSections(), 2)
    
        // first section of tableView should have 2 items
        XCTAssertEqual(viewController.tableView.numberOfItemsInSection(sectionIndex: 0), 2)
        
        // second section of tableView should have 1 item
        XCTAssertEqual(viewController.tableView.numberOfItemsInSection(sectionIndex: 1), 1)
    }
    
    func testRenderCellForTransactions() {
        
        let viewModel = MockViewModel()
        
        viewModel.sections = [
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Argos"), Transaction(description: "Vapiano")]
            ),
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Vegan")]
            )
        ]
        
        let viewController = TransactionListViewController(viewModel: viewModel)
        _ = viewController.view
        
        XCTAssertEqual(viewController.tableView.cellTitle(sectionIndex: 0, rowIndex: 0), "Argos")
        XCTAssertEqual(viewController.tableView.cellTitle(sectionIndex: 0, rowIndex: 1), "Vapiano")
        XCTAssertEqual(viewController.tableView.cellTitle(sectionIndex: 1, rowIndex: 0), "Vegan")
    }
    
    func testOpenPage() {
        
        // create view controller with mock delegate
        let viewModel = MockViewModel()
        let viewController = TransactionListViewController(viewModel: viewModel)
        let mockDelegate = MockShowDetailsCoordinatorDelegate()
        viewController.delegate = mockDelegate
        
        // simulate openPage function call
        viewController.openPage(transaction: Transaction(description: "School"))
        
        // mock delegate's showDetails function should be called once
        XCTAssertEqual(mockDelegate.showDetailsCount, 1)
        
        // first parameter should be the parameter that is passed to the openPage
        XCTAssertEqual(mockDelegate.showDetailsParameterTransaction?.description, "School")
        
        // second parameter should be the view controller
        XCTAssertEqual(mockDelegate.showDetailsParameterFromViewController, viewController)

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
    
    func cellTitle(sectionIndex: Int, rowIndex: Int) -> String? {
        let TransactionListCell = cell(sectionIndex: sectionIndex, rowIndex: rowIndex) as! TransactionListTableViewCell
        return TransactionListCell.title.text
    }
}

class MockViewModel: TransactionListViewModelProtocol {
    
    var viewDelegate: TransactionListViewProtocol?
    
    var sections = [DaySection]()
    
    var loadCount = 0
    
    func load() {
        loadCount += 1
    }
    
    func getTitle() -> String {
        return "Kumbara Test Header"
    }
    
    func didRowSelect(indexSection: Int, indexRow: Int) {
        
    }
    
    func didPressLong(indexSection: Int, indexRow: Int) -> UIViewController {
        return TransactionDetailViewController()
    }
    
}

class MockShowDetailsCoordinatorDelegate: ShowDetailsCoordinatorDelegate {
    
    var showDetailsCount = 0
    var showDetailsParameterTransaction: Transaction?
    var showDetailsParameterFromViewController: UIViewController?
    
    func showDetails(transaction: Transaction, fromViewController: UIViewController) {
        showDetailsCount += 1
        showDetailsParameterTransaction = transaction
        showDetailsParameterFromViewController = fromViewController
    }
}
