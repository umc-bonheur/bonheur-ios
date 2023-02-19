//
//  GetTotalBoardResponse.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import Foundation

struct GetTotalBoardsResponse: Codable {
    let group: [String: [GetBoardsResponse]]
    let orderType: String
    let last: Bool
    
    init() {
        self.group = [:]
        self.orderType = ""
        self.last = false
    }
    
    init(group: [String: [GetBoardsResponse]], orderType: String, last: Bool) {
        self.group = group
        self.orderType = orderType
        self.last = last
    }
}

struct GetBoardsResponse: Codable {
    let boardId: Int
    let contents: String
    let boardTags: [String]
    let image: String?
    let createdAtDate: String
    let createdAtTime: String
    
    init() {
        self.boardId = 0
        self.contents = ""
        self.boardTags = []
        self.image = ""
        self.createdAtDate = ""
        self.createdAtTime = ""
    }
    
    init(boardId: Int, contents: String, boardTags: [String], image: String?, createdAtDate: String, createdAtTime: String) {
        self.boardId = boardId
        self.contents = contents
        self.boardTags = boardTags
        self.image = image
        self.createdAtDate = createdAtDate
        self.createdAtTime = createdAtTime
    }
}
