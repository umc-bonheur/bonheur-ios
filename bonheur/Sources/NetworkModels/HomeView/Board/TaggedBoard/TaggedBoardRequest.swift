//
//  TaggedBoardRequest.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import Foundation

struct TaggedBoardRequest: Codable {
    let tagRequest: GetBoardByTagRequest
    // let pageable: Pageable
}

struct GetBoardByTagRequest: Codable {
    let orderType: String
    let lastBoardId: Int
    let tagIds: [Int]
}

/*
 struct Pageable: Codable {
 let page: Int
 let size: Int
 let sort: [String]
 }
 */
