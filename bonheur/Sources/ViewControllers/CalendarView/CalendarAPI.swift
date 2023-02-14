//
//  CalendarAPI.swift
//  bonheur
//
//  Created by Rocky on 2023/02/11.
//

import Foundation
import Moya

public class CalendarAPI {
    static let shared = CalendarAPI()
    let provider = MoyaProvider<BonheurCalendarAPIService>()
    
    
    func getCalendarAPI(year: String, month: String, completion: @escaping ([[String: Any]]) -> Void) {
        provider.request(.getData(year, month)) { result in
            switch result {
            case .success(let response):
                let result = try? response.map(CalendarViewDataResponse.self)
                
                guard let receivedData = result?.data else { return }
                let responseData = receivedData.map({ data in
                    let day = String(format: "%02d", data.day)
                    let dateString = "\(year)-\(month)-\(day)"
                    let isWrite = data.isWrite
                    return ["day": dateString, "isWrite": isWrite]
                })

                completion(responseData)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    
}


