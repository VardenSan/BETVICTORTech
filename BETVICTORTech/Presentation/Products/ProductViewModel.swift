//
//  ProductViewModel.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 6/3/22.
//

import Foundation

enum DiscountType: Int {
    case GAMEAFTERHOMEWORK = 10
    case STAYSAFE = 5
    case PLAYINYOURGARDEN = 20
    case NONE = 0
}

enum Tags: String {
    case videogame
    case boardgame
    case puzzle
    case lego
    case playmobil
    case trampoline
    case basketball
    case basket
    case soccer
    case goal
}

struct ProductViewModel {
    
    let product: Product
    
    init(with product: Product) {
        self.product = product
    }
    
    var name: String {
        return product.name ?? ""
    }
    
    var price: String {
        guard let price = product.price else { return "" }
        return "Price: \(price)"
    }
    
    var tag: String {
        return product.tag ?? ""
    }
    
    var image: String {
        return product.image ?? ""
    }
    
    var quantity: String {
        guard let quantity = product.quantity else { return "" }
        return "Quantity: \(quantity)"
    }

    var discount: DiscountType {
        guard let quantity = product.quantity, let tag = product.tag, let price = product.price else {
            return DiscountType.NONE
        }
        switch Tags(rawValue: tag) {
        case .videogame, .boardgame:
            if quantity > 2, price > 24.0 {
                return DiscountType.GAMEAFTERHOMEWORK
            }
        case .puzzle, .lego, .playmobil:
            if quantity > 1 {
                return DiscountType.STAYSAFE
            }
        case .trampoline, .basketball, .basket, .soccer, .goal:
            return DiscountType.PLAYINYOURGARDEN
        default:
            return DiscountType.NONE
        }
        return DiscountType.NONE
    }
    
    var totalDiscount: String {
        guard let quantity = product.quantity else { return "" }
        return "Discount: -\(discount.rawValue*quantity)"
    }
    
    var finalPrice: Double {
        guard let price = product.price, let quantity = product.quantity else { return 0 }
        let discount = Double(quantity)*price-Double(discount.rawValue*quantity)
        return discount > 0 ? discount : 0
    }
}
