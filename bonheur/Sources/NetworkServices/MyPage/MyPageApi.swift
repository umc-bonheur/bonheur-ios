//
//  MyPageApi.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/10.
//

import Foundation
import Moya

public class MyPageAPI {
    
    static let shared = MyPageAPI()
    var mypageProvider = MoyaProvider<MyPageService>()
  
    public init() { }
  
    // MARK: - 활동 종합 조회
    func userRecords(completion: @escaping(NetworkResult<Any>) -> Void) {
        mypageProvider.request(.userRecords) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                print(response)
                
                let networkResult = self.judgeUserRecordsStatus(by: statusCode, data)
                completion(networkResult)
          
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeUserRecordsStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<ActiveRecord>.self, from: data) else { return .pathError } // ActiveRecord
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
    
    // MARK: - 활동 월별 조회
    func monthRecords(completion: @escaping(NetworkResult<Any>) -> Void) {
        mypageProvider.request(.monthRecords) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                print(response)
                
                let networkResult = self.judgeMonthRecordsStatus(by: statusCode, data)
                completion(networkResult)
          
            case .failure(let err):
                print(err)
            }
        }
    }
        
    private func judgeMonthRecordsStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[MonthRecord]>.self, from: data) else { return .pathError } // [MonthRecord] -> data를 배열로 만들기
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
    
    // MARK: - 활동 요일별 조회
    func dayRecords(completion: @escaping(NetworkResult<Any>) -> Void) {
        mypageProvider.request(.dayRecords) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                print(response)
                
                let networkResult = self.judgeDayRecordsStatus(by: statusCode, data)
                completion(networkResult)
          
            case .failure(let err):
                print(err)
            }
        }
    }
        
    private func judgeDayRecordsStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[DayRecord]>.self, from: data) else { return .pathError }
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
    
    // MARK: - 활동 시간별 조회
    func hourRecords(completion: @escaping(NetworkResult<Any>) -> Void) {
        mypageProvider.request(.hourRecords) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                print(response)
                
                let networkResult = self.judgeHourRecordsStatus(by: statusCode, data)
                completion(networkResult)
          
            case .failure(let err):
                print(err)
            }
        }
    }
        
    private func judgeHourRecordsStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[HourRecord]>.self, from: data) else { return .pathError }
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
    
    // MARK: - 활동 태그별 조회
    func tagRecords(completion: @escaping(NetworkResult<Any>) -> Void) {
        mypageProvider.request(.tagRecords) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                print(response)
                
                let networkResult = self.judgeTagRecordsStatus(by: statusCode, data)
                completion(networkResult)
          
            case .failure(let err):
                print(err)
            }
        }
    }
        
    private func judgeTagRecordsStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[TagRecord]>.self, from: data) else { return .pathError }
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
