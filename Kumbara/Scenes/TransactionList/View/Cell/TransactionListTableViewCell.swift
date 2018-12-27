//
//  TransactionListTableViewCell.swift
//  MusicApp
//
//  Created by Gamze on 11/27/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

final class TransactionListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var moneyImageView: UIImageView!
    
    /**
     * Setups cell.
     * @param transaction: transaction object to set cell.
     */
    func setup(with transaction: Transaction) {
        
        selectionStyle = .none
        
        title.text = transaction.description
        amount.text = transaction.amount + " £"
        
        if (transaction.amount.range(of:"-") != nil){
            moneyImageView.image = UIImage(named: "money-out")
        } else {
            moneyImageView.image = UIImage(named: "money-in")
        }
    }
}
