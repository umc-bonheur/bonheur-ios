//
//  OAuthService.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/04.
//

import Foundation
import Moya

enum AuthService {
    case socialSignUp(socialSignUpRequest: SocialSignUpRequest)
    case login(loginRequest: LoginRequest) // 로그인
    case logout // 로그아웃
    case withdrawal // 회원 탈퇴
}

extension AuthService: TargetType {
    // MARK: - baseURL (서버의 endpoint 도메인)
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    // MARK: - path (도메인 뒤에 추가될 path)
    var path: String {
        switch self {
        case .socialSignUp:
            return "/auth/social-signup"
        case .login:
            return "/auth/login"
        case .logout:
            return "/auth/logout"
        case .withdrawal:
            return "/auth/withdrawal"
        }
    }
    
    // MARK: - HTTP method (get, post, patch, delete)
    var method: Moya.Method {
        switch self {
        case .socialSignUp, .login, .logout:
            return .post
        case .withdrawal:
            return .delete
        }
    }
    
    // MARK: - task (request에 사용될 파라미터)
    // 서버에 보낼 데이터가 없다면 .requestPlain
    // 파라미터로 보낼 데이터가 있다면 .requestParameters (ex. http://dev.umc-bonheur.shop/api/boards?memberId=1&page=0&size=1&sort=string)
    // 서버에 보낼 데이터(body)가 있다면 .requestJSONEncodable
    // 참고: https://moya.github.io/Enums/Task.html
    var task: Moya.Task {
        switch self {
        case .socialSignUp(let socialSignUpRequest):
            return .requestJSONEncodable(socialSignUpRequest)
        case .login(let loginRequest):
            return .requestJSONEncodable(loginRequest)
        case .withdrawal:
            return .requestPlain
        // TODO: 수정해야 됨
        case .logout:
            return .requestPlain
        }
    }
    
    // MARK: - HTTP Header
    // 토큰을 같이 보내야 한다면 return Const.Header.tokenHeader
    // 같이 보내지 않아도 된다면 .none
    var headers: [String: String]? {
        switch self {
        // TODO: 수정해야 됨
        case .socialSignUp, .login, .logout:
            return .none
        case .withdrawal:
            return Const.Header.authorizationHeader
        }
    }
}
