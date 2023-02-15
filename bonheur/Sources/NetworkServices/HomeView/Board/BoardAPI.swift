//
//  BoardAPI.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/15.
//

import UIKit
import Moya

public class BoardAPI {
    static let shared = BoardAPI()
    var boardProvider = MoyaProvider<BoardService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }

    func getTotalBoard(orderType: String, lastBoardId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        boardProvider.request(.getTotalBoard(orderType: orderType, lastBoardId: lastBoardId)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeGetTotalBoardStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    private func judgeGetTotalBoardStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<GetTotalBoardsResponse>.self, from: data) else { return .pathError }
        
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
