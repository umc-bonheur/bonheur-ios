//
//  CreateBoardRequest.swift
//  bonheur
//
//  Created by κΉμν on 2023/02/15.
//

import Foundation

struct CreateBoardRequest: Codable {
    let contents: String
    let tagIds: [Int]
}
