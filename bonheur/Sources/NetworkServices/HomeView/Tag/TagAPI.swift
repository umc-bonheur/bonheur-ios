//
//  TagAPI.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/14.
//

import UIKit
import Moya

public class TagAPI {
    static let shared = TagAPI()
    var tagProvider = MoyaProvider<TagService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    
    func createTag(createTagRequest: CreateTagRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        tagProvider.request(.createTag(createTagRequest: createTagRequest)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeCreateTagStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func getTag(tagName: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        tagProvider.request(.getTag(tagName: tagName)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeGetTagStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print("error: \(error)")
            }
            
        }
    }
    
    private func judgeCreateTagStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<CreateTagResponse>.self, from: data) else { return .pathError }
        
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

    private func judgeGetTagStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<String>.self, from: data) else { return .pathError }
        
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
