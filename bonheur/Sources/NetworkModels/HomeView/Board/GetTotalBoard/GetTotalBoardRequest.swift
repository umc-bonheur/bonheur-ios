//
//  GetTotalBoardRequest.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import Foundation

struct GetTotalBoardRequest: Codable {
    let orderType: String
    let lastBoardId: Int
}
