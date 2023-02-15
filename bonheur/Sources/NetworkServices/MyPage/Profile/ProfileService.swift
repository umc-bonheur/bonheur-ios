//
//  ProfileService.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/15.
//

import Foundation
import Moya

enum ProfileService {
    case getProfile
    case updateProfile
}

extension ProfileService: TargetType {

    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getProfile:
            return "/member/profiles"
        case .updateProfile:
            return "/member/profiles"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProfile:
            return .get
        case .updateProfile:
            return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .getProfile, .updateProfile:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getProfile, .updateProfile:
            let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
            let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId ?? ""]
            return authorizationHeader
        }
    }
}
