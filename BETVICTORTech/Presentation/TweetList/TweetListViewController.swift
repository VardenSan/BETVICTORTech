//
//  TweetListViewController.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import UIKit

protocol TweetListViewPresenter: AnyObject {
    
}

class TweetListViewController: BasePaginationViewController<TweetViewModel, Tweet, TweetListTableViewCell>, TweetListViewPresenter {
        
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .blue
        setupUI()
    }
    
    func setupUI() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "What do you want to search?"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension TweetListViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let searchText = (searchController.searchBar.text ?? "")
        guard let presenter = presenter as? TweetListPresenterView else { return }
        presenter.search(searchText)
    }
}
