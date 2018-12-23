//
//  DateUtility.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import Foundation

final class DateUtility {
    
    static func formatDate(date: Date, format: String? = "EEEE, MMM dd, yyyy") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}

