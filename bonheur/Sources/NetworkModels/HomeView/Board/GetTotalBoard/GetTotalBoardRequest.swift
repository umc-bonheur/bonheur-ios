//
//  GetTotalBoardRequest.swift
//  bonheur
//
//  Created by κΉμν on 2023/02/15.
//

import Foundation

struct GetTotalBoardRequest: Codable {
    let orderType: String
    let lastBoardId: Int
}
