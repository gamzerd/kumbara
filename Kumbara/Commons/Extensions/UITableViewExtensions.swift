//
//  UITableViewExtensions.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(_ cell: UITableViewCell.Type) {
        register(UINib(nibName: cell.identifier, bundle: nil), forCellReuseIdentifier: cell.identifier)
    }
}
