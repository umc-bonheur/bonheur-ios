//
//  BoardService.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import UIKit
import Moya

enum BoardService {

    case getTotalBoard(getTotalBoardRequest: GetTotalBoardRequest)
    case createBoard(createBoardRequest: CreateBoardRequest)
    case taggedBoard(taggedBoardRequest: TaggedBoardRequest)
    case getBoardInfo(boardId: Int)
    case deleteBoard(boardId: Int)
    // case updateBoard() -> TODO: parmas + body로 구현
}

/*
 extension BoardService: TargetType {
 var baseURL: URL {
 return URL(string: Const.URL.baseURL)!
 }
 
 var path: String {
 switch self {
 case .getTotalBorad:
 return "/boards"
 case .getTag(let tagName):
 return "/tag/\(tagName)"
 }
 }
 
 var method: Moya.Method {
 switch self {
 case .createTag:
 return .post
 case .getTag:
 return .get
 }
 }
 
 var task: Moya.Task {
 switch self {
 case .createTag(let createTagRequest):
 return .requestJSONEncodable(createTagRequest)
 
 case .getTag:
 return .requestPlain
 }
 }
 
  MARK: - HTTP Header
 var headers: [String: String]? {
 switch self {
 case .createTag, .getTag:
 let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
 let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId ?? ""]
 return authorizationHeader
 }
 }
 }
 
 */
