//
//  CalendarViewDataResponse.swift
//  bonheur
//
//  Created by Rocky on 2023/02/07.
//

import Foundation

struct CalendarViewDataResponse: Codable {
    let resultCode: String
    let message: String
    let data: [ResponseData]
    
    struct ResponseData: Codable {
        var day: Int
        var isWrite: Bool
    }
}
