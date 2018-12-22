//
//  ServiceProtocol.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    
    func get<D>(path: String, responseType: D.Type, callback: @escaping (D?, Error?) -> Void) where D : Decodable
}
