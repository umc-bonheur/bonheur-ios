//
//  RequestModel.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/10.
//

import Foundation

// 프로필 수정
struct UpdateMemberProfileRequest: Codable {
    let image: String
    let nickname: String
}
