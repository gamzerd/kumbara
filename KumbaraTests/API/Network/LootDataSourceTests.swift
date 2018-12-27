//
//  LootDataSourceTests.swift
//  KumbaraTests
//
//  Created by Gamze on 12/24/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import XCTest
@testable import Kumbara

class LootDataSourceTests: XCTestCase {

    func testInit() {
        
        let ds = LootDataSource()
        XCTAssertNotNil(ds.api)
    }
    
    func testGetTransactions() {
        
        let ds = LootDataSource()
        let service = MockService(url: "url/")
        ds.api = service
        
        var listReturnedFromCallback: [Transaction]?
        ds.getTransactions(callback: { list,_ in
            listReturnedFromCallback = list
        })
        XCTAssertEqual(service.callCount, 1)
        XCTAssertEqual(service.callParameterPath!, "transactions")
        XCTAssertEqual(listReturnedFromCallback!.count, 2)
        XCTAssertEqual(listReturnedFromCallback![0].description, "Marks & Spencer")
        XCTAssertEqual(listReturnedFromCallback![1].description, "Disney Store")
    }

}

class MockService: Service {
    
    var callCount = 0
    var callParameterPath: String?
    
    override func get<D>(path: String, responseType: D.Type, callback: @escaping (D?, Error?) -> Void) where D : Decodable {
        callCount += 1
        callParameterPath = path
        let list: Array<Transaction> = [Transaction(description: "Marks & Spencer"), Transaction(description: "Disney Store")]
        let response = TransactionListResponse(list)
        callback((response as! D), nil)
    }
}

