//
//  TagService.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/14.
//

import UIKit
import Moya

enum TagService {
    case createTag(createTagRequest: CreateTagRequest)
    case getTag(tagName: String)
}

extension TagService: TargetType {
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .createTag:
            return "/tags"
        case .getTag(let tagName):
            return "/tags/\(tagName)"
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
    
    // MARK: - HTTP Header
    var headers: [String: String]? {
        switch self {
        case .createTag, .getTag:
            let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
            let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId ?? ""]
            return authorizationHeader
        }
    }
}
