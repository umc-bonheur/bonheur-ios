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
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .writing:
            return "/boards"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .writing:
            return .post
        }
    }
    
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

    var headers: [String: String]? {
        switch self {
        case .writing:
            let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
            let authorizationHeader = ["Content-Type": "application/json", "Authorization": sessionId ?? ""]
            return authorizationHeader
        }
    }
}
