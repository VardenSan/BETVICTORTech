//
//  ProductListPresenter.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 6/3/22.
//

import Foundation

protocol ProductListPresenterView {
    func viewDidLoad()
    func toBasket()
}

class ProductListPresenter: ProductListPresenterView {
    
    let useCase: UseCaseImp<Products>
    let navigator: Navigator
    weak var viewController: ProductListViewPresenter?
    
    var products: [Product] = []
        
    init(useCase: UseCaseImp<Products>, navigator: Navigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func viewDidLoad() {
        fetch()
    }
    
    func setViewDelegate(viewController: ProductListViewPresenter?) {
        self.viewController = viewController
    }
    
    func fetch() {
        useCase.execute(type: .products) { result in
            switch result {
            case .success(let productList):
                self.products = productList.products
                self.viewController?.setupUI(viewModels: productList.products.map({
                    ProductViewModel(with: $0)
                }))
            case .failure(let error):
                guard let errorCode = error.errorCode else { return }
                switch CommonError(rawValue: errorCode) {
                default:
                    self.viewController?.showError(error: error.toString())
                }
            }
        }
    }
    
    func toBasket() {
        navigator.toBasket(products: products)
    }
}
