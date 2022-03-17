//
//  Product.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

struct Products: Codable {

    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products
    }
}


struct Product: Codable {

    let id: String
    let name: String?
    let price: Double?
    let tag: String?
    let image: String?
    var quantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case tag
        case image
        case quantity
    }
}
