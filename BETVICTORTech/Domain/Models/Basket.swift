//
//  Basket.swift
//  myToysTechlab (iOS)
//
//  Created by Sergio TIMP on 6/3/22.
//

import Foundation

struct Basket: Codable {

    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products = "user_basket"
    }
}
