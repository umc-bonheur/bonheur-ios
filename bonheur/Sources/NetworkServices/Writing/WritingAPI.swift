//
//  WritingAPI.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/15.
//

import Foundation
import UIKit
import Moya

public class WritingAPI {
    static let shared = WritingAPI()
    var writingProvider = MoyaProvider<WritingService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }

    func createRecord(writingJSON: WritingJSON, images: [UIImage], completion: @escaping (NetworkResult<Any>) -> Void) {
        writingProvider.request(.writing(WritingJSON: writingJSON, images: images)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeWritingStatus(by: statusCode, data)
                completion(networkResult)

            case .failure(let error):
                print("error: \(error)")
            }
        }
    }

    private func judgeWritingStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<WritingResponse>.self, from: data) else { return .pathError }

        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "None-data")
        case 400..<500:
            return .requestError(decodedData.resultCode, decodedData.message)
        case 500:
            return .serverError
        default:
            return .networkFail
        }
    }
}
