//
//  LoginResponse.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/05.
//

import Foundation

struct LoginResponse: Codable {
    let sessionId: String
    let memberId: Int
}
