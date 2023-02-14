//
//  WritingService.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/15.
//

import Foundation
import UIKit
import Moya

enum WritingService {
    case writing(WritingJSON: WritingJSON, images: [UIImage])
}

extension WritingService: TargetType {
    // MARK: - baseURL (서버의 endpoint 도메인)
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    // MARK: - path (도메인 뒤에 추가될 path)
    var path: String {
        switch self {
        case .writing:
            return "/boards"
        }
    }
    
    // MARK: - HTTP method (get, post, patch, delete)
    var method: Moya.Method {
        switch self {
        case .writing:
            return .post
        }
    }
    
    // MARK: - task (request에 사용될 파라미터)
    // 서버에 보낼 데이터가 없다면 .requestPlain
    // 파라미터로 보낼 데이터가 있다면 .requestParameters (ex. http://dev.umc-bonheur.shop/api/boards?memberId=1&page=0&size=1&sort=string)
    // 서버에 보낼 데이터(body)가 있다면 .requestJSONEncodable
    // 참고: https://moya.github.io/Enums/Task.html
    var task: Moya.Task {
        switch self {
        case .writing(let writingJSON, let images):
            var multipartFormData: [MultipartFormData] = []
            
            let requestData = try? JSONEncoder().encode(writingJSON)
            multipartFormData.append(MultipartFormData(provider: .data(requestData!), name: "createBoardRequest", mimeType: "application/json"))
            
            for image in images {
                let imageData = image.jpegData(compressionQuality: 1.0)
                multipartFormData.append(MultipartFormData(provider: .data(imageData!), name: "images", fileName: "image.jpg", mimeType: "image/gif"))
            }
                                     
            return .uploadMultipart(multipartFormData)
        }
    }
        // MARK: - HTTP Header
        var headers: [String: String]? {
            switch self {
            case .writing:
                let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
                let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId ?? ""]
                return authorizationHeader
            }
        }
}
