//
//  AppContainerTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/25/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest
@testable import Kumbara

class AppContainerTests: XCTestCase {
    
    func testInit() {
        
        let container = AppContainer()
        
        XCTAssertNotNil(container.dataSource)
        XCTAssertNotNil(container.router)
    }
}
