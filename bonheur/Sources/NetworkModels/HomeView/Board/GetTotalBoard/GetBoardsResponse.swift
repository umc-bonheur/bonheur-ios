//
//  GetTotalBoardResponse.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import Foundation

struct GetTotalBoardsResponse: Codable {
    let group: DateGroup
    let orderType: String
    let last: Bool
}

struct DateGroup: Codable {
    let oneDayGroup: [GetBoardsResponse]
}

struct GetBoardsResponse: Codable {
    let boardId: Int
    let contents: String
    let boardTags: [String]
    let image: String?
    let createdAtDate: String
    let createdAtTime: String
}
