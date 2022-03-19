//
//  BasePaginationViewController.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import UIKit

protocol BasePaginationViewPresenter: BaseTableViewController {
    func setup(_ viewModels: [Any])
    func hidePTR()
    func showEmptyView(type: EmptyType)
    func hideEmptyView()
    func showErrorView(errorMessage: String)
    func refreshView()
    func deleteViewModels()
}

class BasePaginationViewController<ItemViewModel: BaseViewModel<Model>, Model, BasicTableViewCell: BasePaginationTableViewCell<ItemViewModel>>: BaseTableViewController, BasePaginationViewPresenter {
    
    var viewModels: [ItemViewModel] = []
    var presenter: BasePaginationPresenterView?
    var ptr: Bool = false
    var emptyView = UIView()
    var errorView = UIView()
    
    override func viewDidLoad() {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        setTableViewFooter()
    }
    
    func setTableViewFooter() {
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshView()
    }
    
    @objc private func refreshData(_ sender: Any) {
        refreshView()
    }
    
    func hidePTR() {
        tableView.refreshControl?.endRefreshing()
    }
    
    func refreshView() {
        hideErrorView()
        //showLoader(view: tableView)
        ptr = true
        presenter?.viewDidLoad()
    }
    
    func setup(_ viewModels: [Any]) {
        if viewModels is [ItemViewModel] {
            self.viewModels.append(contentsOf: viewModels.map({$0 as! ItemViewModel}))
            hideLoader()
            tableView.reloadData()
            presenter?.allItemsLoaded()
        }
    }
    
    func deleteViewModels() {
        viewModels = []
    }
    
    func showEmptyView(type: EmptyType) {
        emptyView = showEmptyView(view: tableView, viewModel: EmptyViewModel(with: type))
        tableView.addSubview(emptyView)
        emptyView.frame = CGRect(x: tableView.frame.minX, y: tableView.frame.minY - 150, width: tableView.frame.width, height: tableView.frame.height)
    }
    
    func hideEmptyView() {
        emptyView.isHidden = true
    }
    
    func showErrorView(errorMessage: String) {
        errorView = showErrorView(view: tableView, viewModel: ErrorViewModel(with: .commonError, errorMessage: errorMessage), selector: #selector(refreshData(_:)))
        tableView.addSubview(errorView)
        errorView.frame = CGRect(x: tableView.frame.minX, y: tableView.frame.minY - 150, width: tableView.frame.width, height: tableView.frame.height)
    }
    
    func hideErrorView() {
        errorView.isHidden = true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.itemSelected(item: viewModels[indexPath.row].element, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.reuseID, for: indexPath) as! BasicTableViewCell
        cell.bind(viewModels[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 4
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
           presenter?.loadMore()
        }
    }
}
