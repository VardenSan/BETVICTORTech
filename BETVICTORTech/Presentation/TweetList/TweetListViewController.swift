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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .blue
        setupUI()
    }
    
    func setupUI() {
        self.title = "notifications_title".localized()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
}
