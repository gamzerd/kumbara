//
//  TransactionDetailViewController.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

class TransactionDetailViewController: UIViewController {
    
   
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: TransactionDetailViewModelProtocol!
    
    convenience init(viewModel: TransactionDetailViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.getTitle()
        tableView.register(UINib(nibName: "TransactionDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        
    }
}

extension TransactionDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 380
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! TransactionDetailTableViewCell
        cell.setup(with: self.viewModel.transaction)
        
        return cell
    }
}
