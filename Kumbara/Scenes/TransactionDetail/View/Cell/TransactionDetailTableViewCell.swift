//
//  TransactionDetailTableViewCell.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit
import MapKit

class TransactionDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var transactionNameLabel: UILabel!
    
    /**
     * Setups cell.
     * @param transaction: transaction object to set cell.
     */
    func setup(with transaction: Transaction) {
        descriptionLabel.text = transaction.post_transaction_balance
        transactionNameLabel.text = transaction.description
    }
}
