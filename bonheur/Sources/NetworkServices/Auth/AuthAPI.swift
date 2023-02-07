//
//  OAuthAPI.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/04.
//

import Foundation
import Moya

public class AuthAPI {
    static let shared = AuthAPI()
    var authProvider = MoyaProvider<AuthService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    
    func socialSignUp(socialSignUpRequest: SocialSignUpRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        authProvider.request(.socialSignUp(socialSignUpRequest: socialSignUpRequest)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeSocialSignUpStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<String>.self, from: data) else { return .pathError }
        
        switch statusCode {
        case 200:
            return .success(decodedData.message)
        case 400..<500:
            return .requestError(decodedData.message)
        case 500:
            return .serverError
        default:
            return .networkFail
        }
    }
    
    private func judgeSocialSignUpStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SocialSignUpResponse>.self, from: data) else { return .pathError }
        
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "None-data")
        case 400..<500:
            return .requestError(decodedData.message)
        case 500:
            return .serverError
        default:
            return .networkFail
        }
    }
}
