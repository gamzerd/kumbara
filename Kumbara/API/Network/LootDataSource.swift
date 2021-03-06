//
//  LootDataSource.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

final class LootDataSource: DataSourceProtocol {
    
    var api: Service
    
    init() {
        self.api = Service(url: AppConstants.API.baseUrl)
    }
    
    /**
     * Gets transaction from api.
     * @param callback: completion callback.
     */
    func getTransactions(callback: @escaping (Array<Transaction>?, Error?) -> Void){
        
        self.api.get(path: "transactions", responseType: TransactionListResponse.self, callback:
            { (data: TransactionListResponse?, error: Error?) -> Void in
                callback(data, nil)
        })
    }
}
