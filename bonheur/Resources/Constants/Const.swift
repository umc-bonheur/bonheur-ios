//
//  Const.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/04.
//

import Foundation

struct Const {
    static let accessToken: String = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? ""
}
