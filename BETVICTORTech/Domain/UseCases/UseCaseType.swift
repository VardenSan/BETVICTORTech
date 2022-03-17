//
//  UseCaseType.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

public enum UseCaseType {
    case endpointWithParams(id: String, params: [String:Any])
    case products
    case basket
}
