//
//  LoginRequest.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/05.
//

import Foundation

struct LoginRequest: Codable {
    let token, socialType: String
}
