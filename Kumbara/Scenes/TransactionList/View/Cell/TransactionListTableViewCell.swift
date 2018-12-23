//
//  TransactionListTableViewCell.swift
//  MusicApp
//
//  Created by Gamze on 11/27/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

class TransactionListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var amount: UILabel!
    @IBOutlet private weak var albumImageView: UIImageView!
    
    /**
     * Setups cell.
     * @param transaction: transaction object to set cell.
     */
    func setup(with transaction: Transaction) {
        
        selectionStyle = .none
        
        title.text = transaction.description
        amount.text = transaction.amount + " £"
        
        if (transaction.amount.range(of:"-") != nil){
            albumImageView.image = UIImage(named: "money-out")
        } else {
            albumImageView.image = UIImage(named: "money-in")
        }
    }
}
