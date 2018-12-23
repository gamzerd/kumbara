//
//  ViewController.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

class TransactionListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: TransactionListViewModelProtocol!
    weak var delegate: ShowDetailsCoordinatorDelegate!

    convenience init(viewModel: TransactionListViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.view = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.getTitle()
        self.viewModel.load()
        tableView.register(UINib(nibName: "TransactionListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }
}

extension TransactionListViewController: TransactionListViewProtocol {
    
    /**
     * Shows searched album list.
     */
    func showList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    /**
     * Called when view model has an error.
     * @param message: to show in alert
     */
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     * Opens detail page.
     * @param transaction: Object to set details, fromViewController: controller to show detail
     */
    func openPage(transaction: Transaction) {
        self.delegate.showDetails(transaction: transaction, fromViewController: self)
    }
    
}

extension TransactionListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.viewModel.sections[section]
        let date = section.day

        return DateUtility.formatDate(date: date)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.viewModel.sections[section]
        return section.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TransactionListTableViewCell
        
        let section = self.viewModel.sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]
        cell.selectionStyle = .none
        cell.setup(with: transaction)

        return cell
    }
    
}

extension TransactionListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didRowSelect(indexSection: indexPath.section, indexRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
