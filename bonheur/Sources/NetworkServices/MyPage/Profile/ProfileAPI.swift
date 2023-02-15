//
//  ProfileAPI.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/15.
//

import Foundation
import Moya

public class ProfileAPI {
    
    static let shared = ProfileAPI()
    var profileProvider = MoyaProvider<ProfileService>()
  
    public init() { }
  
    func getProfile(completion: @escaping(NetworkResult<Any>) -> Void) {
        profileProvider.request(.getProfile) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                print(response)
                
                let networkResult = self.judgeGetProfileStatus(by: statusCode, data)
                completion(networkResult)
          
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func updateProfile(completion: @escaping(NetworkResult<Any>) -> Void) {
        profileProvider.request(.updateProfile) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                print(response)
                
                let networkResult = self.judgeUpdateProfileStatus(by: statusCode, data)
                completion(networkResult)
          
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeGetProfileStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<GetProfileResponse>.self, from: data) else { return .pathError }
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
    
    private func judgeUpdateProfileStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<UpdateProfileResponse>.self, from: data) else { return .pathError }
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

