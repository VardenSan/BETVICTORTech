//
//  TweetListPresenter.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

protocol TweetListPresenterView: BasePresenterView {
    func search(_ text: String)
    func viewWillDisappear()
}

class TweetListPresenter: BasePaginationPresenter<Tweet, TweetViewModel, DefaultNavigator>, TweetListPresenterView {
    
    var users: [User] = []
    var timer = Timer()
    var searchText: String = "I"
            
    init(useCase: UseCaseImp<PaginationResult<Tweet>>, navigator: DefaultNavigator) {
        super.init(paginatedUseCase: useCase, useCaseType: .getTweets(params: "I"), navigator: navigator, emptyType: .tweetList)
    }
    
    override func viewDidLoad() {
        initializeTimer()
    }
    
    func initializeTimer() {
        self.fetch(ptr: true)
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateTweets), userInfo: nil, repeats: true)
    }
    
    @objc func updateTweets() {
        self.fetch(ptr: true)
    }
    
    override func fetch(ptr: Bool) {
        if ptr {
            users = []
        }
        super.fetch(ptr: ptr)
    }
    
    override func updateItems(items: [Tweet], includes: IncludeData?) {
        guard let users = includes?.users else { return }
        self.users.append(contentsOf: users)
        if users.count == items.count {
            let viewModels: [TweetViewModel] = items.enumerated().map({ (index, element) in let viewModel = TweetViewModel(with: element)
                viewModel.user = users[index]
                viewModel.searchText = searchText
                return viewModel
            })
            viewController?.setup(viewModels)
        }
    }
    
    func search(_ text: String) {
        searchText = text
        self.useCaseType = .getTweets(params: text)
        fetch(ptr: true)
    }
    
    func viewWillDisappear() {
        timer.invalidate()
    }
}
