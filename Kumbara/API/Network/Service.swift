//
//  Service.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

class Service: ServiceProtocol {
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
    /**
     * Makes a GET http request to the given path and passes the result to the callback.
     * field values based on the corresponding rate value in the list.
     */
    func get<D>(path: String, responseType: D.Type, callback: @escaping (D?, Error?) -> Void) where D : Decodable {
        
        // build URL
        let endpoint = self.url + path
        let urlComponents = NSURLComponents(string: endpoint)!
        
        let paramMap: [String:String] = [:]
        
        // add each key to query parameters
        urlComponents.queryItems = paramMap.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        let request = URLRequest(url: urlComponents.url!)
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedResponse = try decoder.decode(responseType, from: data)
                
                // return result to the callback
                callback(decodedResponse, nil)
            } catch {
                // return error
                callback(nil, error)
            }
        }
        
        task.resume()
    }
}
