//
//  BasePaginationPresenter.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

protocol BasePaginationPresenterView: BasePresenter {
    func fetch(ptr: Bool)
    func loadMore()
    func itemSelected(position: Int)
    func allItemsLoaded()
    func setViewDelegate(viewController: BasePaginationViewPresenter)
}

class BasePaginationPresenter<Element: Codable, ItemViewModel: BaseViewModel<Element>, Navigator: BaseNavigator>: BasePresenter, BasePaginationPresenterView {
    
    var items: [Element]
    var pageData: PageData
    var paginatedUseCase: UseCaseImp<PaginationResult<Element>>
    var useCaseType: UseCaseType
    weak var viewController: BasePaginationViewPresenter?
    var navigator: BaseNavigator
    var emptyType: EmptyType
    
    init(paginatedUseCase: UseCaseImp<PaginationResult<Element>>, useCaseType: UseCaseType, navigator: BaseNavigator, emptyType: EmptyType) {
        self.paginatedUseCase = paginatedUseCase
        self.useCaseType = useCaseType
        self.navigator = navigator
        self.pageData = PageData()
        self.items = []
        self.emptyType = emptyType
    }
    
    func setViewDelegate(viewController: BasePaginationViewPresenter) {
        self.viewController = viewController
    }
    
    override func viewDidLoad() {
        fetch(ptr: true)
    }
    
    func fetch(ptr: Bool) {
        if ptr {
            self.items = []
            pageData.nextToken = nil
            viewController?.deleteViewModels()
        }
        pageData.isLoading = true
        paginatedUseCase.execute(nextToken: pageData.nextToken, type: useCaseType) { [self] result in
            switch result {
            case .success(let paginationResult):
                handleResult(paginationResult: paginationResult)
                checkEmtpyView(collection: paginationResult.data)
                checkPTR(ptr: ptr)
            case .failure(let error):
                guard let errorCode = error.errorCode else { return }
                switch CommonError(rawValue: errorCode) {
                default:
                    self.checkPTR(ptr: ptr)
                    self.viewController?.showErrorView(errorMessage: error.toString())
                }
            }
        }
    }
    
    func checkPTR(ptr: Bool) {
        if ptr {
            self.viewController?.hidePTR()
        }
    }
    
    func checkEmtpyView(collection: [Element]) {
        if collection.isEmpty {
            self.viewController?.showEmptyView(type: emptyType)
        } else {
            self.viewController?.hideEmptyView()
        }
    }
    
    func handleResult(paginationResult: PaginationResult<Element>) {
        self.items.append(contentsOf: paginationResult.data)
        self.pageData = paginationResult.pageData
        self.updateItems(items: paginationResult.data, includes: paginationResult.includes)
    }
    
    func updateItems(items: [Element], includes: IncludeData?) {
        viewController?.setup(items.map({ItemViewModel(with: $0)}))
    }
    
    func loadMore() {
        if pageData.nextToken != nil, !pageData.isLoading {
            fetch(ptr: false)
        }
    }
    
    func itemSelected(position: Int) {
        navigator.toItem(item: items[position])
    }
    
    func allItemsLoaded() {
        pageData.isLoading = false
    }
}
