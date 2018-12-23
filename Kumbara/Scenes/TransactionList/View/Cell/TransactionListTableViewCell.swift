//
//  TransactionListTableViewCell.swift
//  MusicApp
//
//  Created by Gamze on 11/27/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

class TransactionListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    /**
     * Setups cell.
     * @param album: transaction object to set cell.
     */
    func setup(with transaction: Transaction) {
        
        title.text = transaction.description
        amount.text = transaction.amount + " £"

        if (transaction.amount.range(of:"-") != nil){
            albumImageView.image = UIImage(named: "money-out")
        } else {
            albumImageView.image = UIImage(named: "money-in")
        }
    }
}
