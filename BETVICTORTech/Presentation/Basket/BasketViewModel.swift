//
//  BasketViewModel.swift
//  myToysTechlab (iOS)
//
//  Created by Sergio TIMP on 6/3/22.
//

import Foundation

struct BasketViewModel {
    
    let basket: Basket
    
    init(with basket: Basket) {
        self.basket = basket
    }
    
    var products: [ProductViewModel] {
        return basket.products.map({ProductViewModel(with: $0)})
    }
    
    var total: String {
        let total = basket.products.map({
            let vm = ProductViewModel(with: $0)
            guard let quantity = $0.quantity, let price = $0.price else { return 0 }
            return Double(quantity)*(price-Double(vm.discount.rawValue*quantity))
        }).reduce(0.0, +)
        let formatedTotal = String(format: "%.2f", total)
        return "Total: \(formatedTotal)"
    }
}
