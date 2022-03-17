//
//  ProductListViewController.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import UIKit

protocol ProductListViewPresenter: AnyObject {
    func setupUI(viewModels: [ProductViewModel])
    func showError(error: String)
    func hidePTR()
}

class ProductListViewController: UITableViewController, ProductListViewPresenter {
        
    var presenter: ProductListPresenterView?
    var viewModels: [ProductViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refresh()
    }
    
    @objc private func refreshData(_ sender: Any) {
        refresh()
    }
    
    func refresh() {
        presenter?.viewDidLoad()
    }
    
    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .always
        self.title = "Products"
        tableView.tableFooterView = UIView()
    }
    
    func setupUI(viewModels: [ProductViewModel]) {
        self.viewModels = viewModels
        hidePTR()
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        showErrorAlert(message: error)
    }
    
    func hidePTR() {
        tableView.refreshControl?.endRefreshing()
    }
    
    @IBAction func basketButtonPressed(_ sender: Any) {
        presenter?.toBasket()
    }
}

extension ProductListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as! ProductListTableViewCell
        cell.bind(viewModel: viewModels[indexPath.row])
        return cell
    }
}
