//
//  TaggedBoardResponse.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import Foundation

struct TaggedBoardResponse: Codable {
    let group: GetTaggedBoardsResponse
    let orderType: String
    let last: Bool
    
}

struct GetTaggedBoardsResponse: Codable {
    let boardId: Int
    let contents: String
    let boardTags: [String]
    let image: String
    
    let createdAtDate: String
    let createdAtTime: String
}
