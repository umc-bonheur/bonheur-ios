//
//  BoardService.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import UIKit
import Moya

enum BoardService {
    case getTotalBoard(orderType: String, lastBoardId: Int)

    /*
    case createBoard(createBoardRequest: CreateBoardRequest)
    case taggedBoard(taggedBoardRequest: TaggedBoardRequest)
    case getBoardInfo(boardId: Int)
    case deleteBoard(boardId: Int)
    case updateBoard() -> TODO: parmas + body로 구현
    */
}

extension BoardService: TargetType {
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getTotalBoard(let orderType, let lastBoardId):
            return "/boards"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTotalBoard:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTotalBoard(let orderType, let lastBoardId):
            return .requestParameters(parameters: ["orderType": orderType, "lastBoardId": lastBoardId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getTotalBoard:
            let sessionId = "5a8c61d5-c401-4686-9d01-5a77afdbe509"
            let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId]
            return authorizationHeader
        }
    }
}
