//
//  DataSourceProtocol.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

protocol DataSourceProtocol {
    
    /**
     * Retrieves the album data from.
     */
    func getTransactions(callback: @escaping (Array<Transaction>?, Error?) -> Void)
}
