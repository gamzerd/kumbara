//
//  ViewController.swift
//  Kumbara
//
//  Created by Gamze on 12/20/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit

final class TransactionListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: TransactionListViewModelProtocol!
    weak var delegate: ShowDetailsCoordinatorDelegate!
    
    convenience init(viewModel: TransactionListViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.viewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.getTitle()
        viewModel.load()
        tableView.register(TransactionListTableViewCell.self)
        registerForPreviewing(with: self, sourceView: tableView)
    }
}

extension TransactionListViewController: TransactionListViewProtocol {
    
    /**
     * Shows transaction list.
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
        present(alert, animated: true, completion: nil)
    }
    
    /**
     * Opens detail page.
     * @param transaction: Object to set details, fromViewController: controller to show detail
     */
    func openPage(transaction: Transaction) {
        delegate.showDetails(transaction: transaction, fromViewController: self)
    }
    
}

extension TransactionListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = viewModel.sections[section]
        let date = section.day
        
        return date.formatDate()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.sections[section]
        return section.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionListTableViewCell.identifier) as! TransactionListTableViewCell
        
        let section = viewModel.sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]
        cell.setup(with: transaction)
        
        return cell
    }
    
}

extension TransactionListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didRowSelect(indexSection: indexPath.section, indexRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension TransactionListViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = tableView.indexPathForRow(at: location) else {
            return nil
        }
        
        return viewModel.didPressLong(indexSection: indexPath.section, indexRow: indexPath.row)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

