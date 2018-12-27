//
//  AppRouterTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/26/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest
@testable import Kumbara

class AppRouterTests: XCTestCase {

    func testInit() {
        
        let router = AppRouter()
        
        XCTAssertNotNil(router.window)
    }
    
    func testStart() {
        
        let router = AppRouter()
        router.start()
        
        XCTAssertNotNil(router.window.rootViewController)
    }
    
    func testShowDetails() {
        
        let router = AppRouter()
        let mockViewController = MockViewController()
        router.showDetails(transaction: Transaction(description: "Argos"), fromViewController: mockViewController)
        
        XCTAssertEqual(mockViewController.showCount, 1)
        XCTAssertNotNil(mockViewController.showParameterFromViewController)
        XCTAssertTrue(mockViewController.showParameterFromViewController is TransactionDetailViewController)
        XCTAssertEqual((mockViewController.showParameterFromViewController as! TransactionDetailViewController).viewModel.transaction.description, "Argos")
    }
}

class MockViewController: UIViewController {
    
    var showCount = 0
    var showParameterFromViewController: UIViewController?
    
    override func show(_ vc: UIViewController, sender: Any?) {
        showCount += 1
        showParameterFromViewController = vc
    }
}
