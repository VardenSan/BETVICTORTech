//
//  BasketPresenter.swift
//  myToysTechlab (iOS)
//
//  Created by Sergio TIMP on 6/3/22.
//

import Foundation

protocol BasketPresenterView {
    func viewDidLoad()
}

class BasketPresenter: BasketPresenterView {
    
    let useCase: UseCaseImp<Basket>
    let navigator: Navigator
    weak var viewController: BasketViewPresenter?
    var basket: Basket?
    let products: [Product]
        
    init(useCase: UseCaseImp<Basket>, navigator: Navigator, products: [Product]) {
        self.useCase = useCase
        self.navigator = navigator
        self.products = products
    }
    
    func viewDidLoad() {
        fetch()
    }
    
    func setViewDelegate(viewController: BasketViewPresenter?) {
        self.viewController = viewController
    }
    
    func fetch() {
        useCase.execute(type: .basket) { result in
            switch result {
            case .success(let basket):
                self.basket = basket
                self.basket?.products = self.setProductsToBasket(basket)
                guard let fullBasket = self.basket else { return }
                self.viewController?.setupUI(viewModel: BasketViewModel(with: fullBasket))
            case .failure(let error):
                guard let errorCode = error.errorCode else { return }
                switch CommonError(rawValue: errorCode) {
                default:
                    self.viewController?.showError(error: error.toString())
                }
            }
        }
    }
    
    func setProductsToBasket(_ basket: Basket) -> [Product] {
        var basketFull: [Product] = []
        for product in products {
            for basketProduct in basket.products {
                if product.id == basketProduct.id {
                    var finalProduct = product
                    finalProduct.quantity = basketProduct.quantity
                    basketFull.append(finalProduct)
                }
            }
        }
        return basketFull
    }
}
