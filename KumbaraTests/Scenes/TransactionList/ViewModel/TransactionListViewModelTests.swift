//
//  TransactionListViewModelTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/25/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest

@testable import Kumbara

class TransactionListViewModelTests: XCTestCase {
    
    func testInit() {
        
        // create the view model
        let vm = TransactionListViewModel(dataSource: MockDataSource())
        
        // dataSource and sections should be initialised
        XCTAssertNotNil(vm.dataSource)
        XCTAssertNotNil(vm.sections)
        XCTAssertEqual(vm.sections.count, 0)
    }
    
    func testGetTitle() {
        
        // create the view model
        let vm = TransactionListViewModel(dataSource: MockDataSource())
        
        // getTitle should return "Kumbara"
        XCTAssertEqual(vm.getTitle(), "Kumbara")
    }
    
    func testLoad() {
        
        // create mock data source and pass it to the view model
        let ds = MockDataSource()
        let vm = TransactionListViewModel(dataSource: ds)
        
        // simulate the load function call
        vm.load()
        
        // mock dataSource's getTransactions function should be called once
        XCTAssertEqual(ds.getTransactionsCount, 1)
    }
    
    func testDidRowSelect() {
        
        // create view model
        let vm = TransactionListViewModel(dataSource: MockDataSource())
        vm.sections = [
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Argos"), Transaction(description: "Vapiano")]
            ),
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Vegan")]
            )
        ]
        
        // create mock view and set it as the viewDelegate of the view model
        let view = MockView()
        vm.viewDelegate = view
        
        // simulate the didRowSelect function call
        vm.didRowSelect(indexSection: 1, indexRow: 0)
        
        // openPage function of the mock view should be called once
        XCTAssertEqual(view.openPageCount, 1)
        XCTAssertNotNil(view.openPageParameter)
        XCTAssertEqual(view.openPageParameter?.description, "Vegan")
    }
    
    func testDidReceiveTransactions() {
        
        // create view model
        let vm = TransactionListViewModel(dataSource: MockDataSource())
        
        // pass the mock view to the view model
        let view = MockView()
        vm.viewDelegate = view
        
        // simulate the didReceiveTransactions function call with list
        vm.didReceiveTransactions(
            list:[
                Transaction(authorisationDate: Date(), description: "Argos"),
                Transaction(authorisationDate: Date(), description: "Vapiano")
            ],
            error: nil
        )
        
        // showList function of the mock view should be called once
        XCTAssertNotNil(vm.sections)
        XCTAssertEqual(vm.sections.count, 1)
        XCTAssertEqual(view.showListCallCount, 1)
    }
    
    func testDidReceiveTransactionsWithError() {
        
        // create view model
        let vm = TransactionListViewModel(dataSource: MockDataSource())
        
        // pass the mock view to the view model
        let view = MockView()
        vm.viewDelegate = view
        
        // simulate didReceiveTransactions function call with error
        vm.didReceiveTransactions(list: nil, error: APIError.NetworkFail())
        
        // sections should not be empty
        XCTAssertNotNil(vm.sections)
        XCTAssertEqual(vm.sections.count, 0)
        
        // correct error parameters should be passed to the mock view
        XCTAssertEqual(view.showErrorCount, 1)
        XCTAssertNotNil(view.showErrorParameter)
        XCTAssertEqual(view.showErrorParameter, "Fetching list failed!")
    }
    
    func testDidPressLong() {
        
        // create view model
        let vm = TransactionListViewModel(dataSource: MockDataSource())
        vm.sections = [
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Argos"), Transaction(description: "Vapiano")]
            ),
            DaySection(
                day: Date(),
                transactions: [Transaction(description: "Vegan")]
            )
        ]
        
        // simulate didPressLong function call
        let detailViewController = vm.didPressLong(indexSection: 0, indexRow: 1)
        
        // detailViewController should not be empty
        XCTAssertNotNil(detailViewController)
        
        //detailViewController should be instance of TransactionDetailViewController
        XCTAssertTrue(detailViewController is TransactionDetailViewController)
        
        // view model of the view controller should have correct transaction
        XCTAssertEqual((detailViewController as! TransactionDetailViewController).viewModel.transaction.description, "Vapiano")
    }
}

enum APIError: Error {
    case NetworkFail()
}

class MockDataSource: DataSourceProtocol {
    
    var getTransactionsCount = 0
    
    func getTransactions(callback: @escaping (Array<Transaction>?, Error?) -> Void) {
        getTransactionsCount += 1
    }
}

class MockView: TransactionListViewProtocol {
    
    var showListCallCount = 0
    
    var openPageCount = 0
    var openPageParameter: Transaction?
    
    var showErrorCount = 0
    var showErrorParameter: String?
    
    func showList() {
        showListCallCount += 1
    }
    
    func showError(message: String) {
        showErrorCount += 1
        showErrorParameter = message
    }
    
    func openPage(transaction: Transaction) {
        openPageCount += 1
        openPageParameter = transaction
    }
}
