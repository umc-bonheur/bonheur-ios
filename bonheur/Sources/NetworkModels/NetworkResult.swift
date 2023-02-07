//
//  NetworkResult.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/04.
//

import Foundation

enum NetworkResult<T> {
    case success(T) // 서버 통신 성공
    case requestError(T) // 요청 에러 발생
    case pathError // 경로 에러
    case serverError // 서버 내부적 에러
    case networkFail // 네트워크 연결 실패
}
