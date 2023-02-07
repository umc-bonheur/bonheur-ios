//
//  SocialSignUpRequest.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/05.
//

import Foundation

struct SocialSignUpRequest: Codable {
    let token: String
    let nickname: String
    let socialType: String
}
