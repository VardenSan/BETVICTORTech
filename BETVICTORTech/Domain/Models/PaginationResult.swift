//
//  PaginationResult.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 18/3/22.
//

import Foundation

struct PaginationResult<Item: Codable>: Codable {
    let pageData: PageData
    let data: [Item]
    let includes: IncludeData?

    enum CodingKeys: String, CodingKey {
        case pageData = "meta"
        case data
        case includes
    }
}

struct PageData: Codable {
    private var newestId: String?
    private var oldestId: String?
    var nextToken: String?
    private let resultCount: Int?
    var isLoading = false
    
    init(_ nextToken: String? = nil, _ newestId: String? = nil, _ oldestId: String? = nil, _ resultCount: Int? = nil) {
        self.nextToken = nextToken
        self.newestId = newestId
        self.oldestId = oldestId
        self.resultCount = resultCount
    }
    
    enum CodingKeys: String, CodingKey {
        case newestId = "newest_id"
        case oldestId = "oldest_id"
        case nextToken = "next_token"
        case resultCount = "result_count"
    }
}

struct IncludeData: Codable {
    let users: [User]?
    
    enum CodingKeys: String, CodingKey {
        case users
    }
}
