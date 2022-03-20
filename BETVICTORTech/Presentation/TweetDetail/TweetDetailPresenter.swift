//
//  TweetDetailPresenter.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 20/3/22.
//

import Foundation

protocol TweetDetailPresenterView {
    func viewDidLoad()
}

class TweetDetailPresenter: TweetDetailPresenterView {
    
    let useCase: UseCaseImp<TweetDetail>
    let navigator: Navigator
    weak var viewController: TweetDetailViewPresenter?
    let tweetId: String
    var tweetDetail: TweetDetail?
            
    init(useCase: UseCaseImp<TweetDetail>, navigator: Navigator, tweetId: String) {
        self.useCase = useCase
        self.navigator = navigator
        self.tweetId = tweetId
    }
    
    func setViewDelegate(viewController: TweetDetailViewPresenter) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        fetch()
    }
    
    func fetch() {
        useCase.execute(type: .getTweet(id: tweetId)) { result in
            switch result {
            case .success(let tweetDetail):
                self.tweetDetail = tweetDetail
                guard let user = tweetDetail.includes?.users?[0] else { return }
                self.viewController?.setup(TweetDetailViewModel(with: tweetDetail.data, user: user))
                self.viewController?.hidePTR()
            case .failure(let error):
                self.viewController?.hidePTR()
                guard let errorCode = error.errorCode else { return }
                switch CommonError(rawValue: errorCode) {
                default:
                    self.viewController?.showErrorView(errorMessage: error.toString())
                }
            }
        }
    }
}
