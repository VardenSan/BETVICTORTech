//
//  BasketViewController.swift
//  myToysTechlab (iOS)
//
//  Created by Sergio TIMP on 6/3/22.
//

import UIKit

protocol BasketViewPresenter: AnyObject {
    func setupUI(viewModel: BasketViewModel)
    func showError(error: String)
}

class BasketViewController: UIViewController, BasketViewPresenter {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableViewConstraint: NSLayoutConstraint!
    
    var presenter: BasketPresenterView?
    var viewModel: BasketViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        scrollView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        self.title = "Basket"
        tableView.tableFooterView = UIView()
    }
    
    func setupUI(viewModel: BasketViewModel) {
        self.viewModel = viewModel
        self.totalLabel.text = viewModel.total
        self.hidePTR()
        self.tableViewConstraint.constant = CGFloat(103*viewModel.products.count)
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        showErrorAlert(message: error)
    }
    
    func hidePTR() {
        scrollView.refreshControl?.endRefreshing()
    }
}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
        guard let viewModel = viewModel else { return cell }
        cell.bind(viewModel: viewModel.products[indexPath.row])
        return cell
    }
}
