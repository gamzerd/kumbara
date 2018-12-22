//
//  Location.swift
//  Kumbara
//
//  Created by Gamze on 12/21/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

// Location model
class Location: Codable {
  
    var latitude: String = ""
    var longitude: String = ""
    
    init(latitude: String = "",
         longitude: String = "")
    {
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
