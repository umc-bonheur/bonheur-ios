//
//  GenericResponse.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/04.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    let resultCode: String
    let message: String
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case resultCode
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCode = (try? values.decode(String.self, forKey: .resultCode)) ?? "IS000"
        message = (try? values.decode(String.self, forKey: .message)) ?? "예상치 못한 에러가 발생하였습니다\n잠시 후 다시 시도해주세요!"
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
