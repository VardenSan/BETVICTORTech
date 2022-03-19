//
//  TweetListPresenter.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

protocol TweetListPresenterView: BasePresenterView {
    
}

class TweetListPresenter: BasePaginationPresenter<Tweet, TweetViewModel, DefaultNavigator>, TweetListPresenterView {
            
    init(useCase: UseCaseImp<PaginationResult<Tweet>>, navigator: DefaultNavigator) {
        super.init(paginatedUseCase: useCase, useCaseType: .getTweets(params: "hola"), navigator: navigator, emptyType: .tweetList)
    }
}
