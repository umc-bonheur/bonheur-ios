//
//  Header.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/05.
//

import Foundation

extension Const {
    struct Header {
        static var authorizationHeader = ["Content-Type": "application/json", "Authorization": Const.sessionId]
        static var multipartHeader = ["Content-Type": "multipart/form-data"]
        static var multipartHeaderWithAuthorization = ["Content-Type": "multipart/form-data", "Authorization": Const.sessionId]
    }
}
