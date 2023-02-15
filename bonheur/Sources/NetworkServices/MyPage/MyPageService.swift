//
//  ApiService.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/10.
//

import Foundation
import Moya

enum MyPageService {
    case userRecords
    case monthRecords
    case dayRecords
    case hourRecords
    case tagRecords
}

extension MyPageService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .userRecords:
            return "/mypages"
        case .monthRecords:
            return "/mypages/month"
        case .dayRecords:
            return "/mypages/day"
        case .hourRecords:
            return "/mypages/time"
        case .tagRecords:
            return "/mypages/tag"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userRecords, .monthRecords, .dayRecords, .hourRecords, .tagRecords:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .userRecords, .monthRecords, .dayRecords, .hourRecords, .tagRecords:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .userRecords, .monthRecords, .dayRecords, .hourRecords, .tagRecords:
            let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
            let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId ?? ""]
            return authorizationHeader
//            return ["Authorization":""] // 커밋하지 말기
        }
    }
}
