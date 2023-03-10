//
//  OAuthService.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/04.
//

import Foundation
import UIKit
import Moya

enum AuthService {
    case socialSignUp(SocialSignUpJSON: SocialSignUpJSON, profileImage: UIImage?)
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
        case .socialSignUp(let socialSignUpJSON, let profileImage):
            var multipartFormData: [MultipartFormData] = []
            
            let requestData = try? JSONEncoder().encode(socialSignUpJSON)
            multipartFormData.append(MultipartFormData(provider: .data(requestData!), name: "socialSignUpRequest", mimeType: "application/json"))
            if profileImage != nil {
                let imageData = profileImage!.jpegData(compressionQuality: 1.0)
                multipartFormData.append(MultipartFormData(provider: .data(imageData!), name: "profileImage", fileName: "image.jpg", mimeType: "image/gif"))
            }
            
            return .uploadMultipart(multipartFormData)
            
        case .login(let loginRequest):
            return .requestJSONEncodable(loginRequest)
            
        case .withdrawal:
            return .requestPlain

        case .logout:
            return .requestPlain
        }
    }
    
    // MARK: - HTTP Header
    var headers: [String: String]? {
        switch self {
        case .socialSignUp:
            return Const.Header.multipartHeader
        case .login:
            return .none
        case .logout, .withdrawal:
            let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
            let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId ?? ""]
            return authorizationHeader
        }
    }
}
