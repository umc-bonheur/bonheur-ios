//
//  BonheurCalendarAPI.swift
//  bonheur
//
//  Created by Rocky on 2023/02/07.
//

import Foundation
import Moya

enum BonheurCalendarAPIService {
    case getData(String, String)
}

extension BonheurCalendarAPIService: TargetType {
    // Base URL
    var baseURL: URL {
        guard let url = URL(string: "https://dev.umc-bonheur.shop/api/") else {
            fatalError("baseURL 가져오기 실패")
        }
        return url
    }
    
    // 요청 경로
    var path: String {
        switch self {
        case .getData(_, _):
            return "calendar"
        }
    }
    
    // HTTP 요청 메소드
    var method: Moya.Method {
        switch self {
        case .getData:
            return .get
        }
    }
    
    // HTTP 작업 유형
    var task: Moya.Task {
        switch self {
        case let .getData(year, month):
            return .requestParameters(parameters: ["year": year, "month": month], encoding: URLEncoding.queryString)
        }
    }
    
    // HTTP 헤더
    var headers: [String : String]? {
        return ["Authorization": "5a8c61d5-c401-4686-9d01-5a77afdbe509", "content-type": "application/json"]
    }
}
