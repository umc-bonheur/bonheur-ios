//
//  Model.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/10.
//

import Foundation

// MARK: - 프로필 수정
struct UpdateMemberProfileResponse: Codable {
    let memberId: Int
}

// MARK: - 통계

// 활동 종합 조회
struct ActiveRecord: Codable {
    let activeDay, countHappy, countTag, recordDay: Int
}

// 월별 조회
struct MonthRecord: Codable {
    let month: String
    let countMonth: Int
    let mostRecordMonth: Bool
}

// 요일별 조회
struct DayRecord: Codable {
    let dayOfWeek: String
    let countDay: Int
    let mostRecordDay: Bool
}

// 시간별 조회
struct HourRecord: Codable {
    let time: String
    let countTime: Int
    let mostRecordTime: Bool
}

// 태그별 조회
struct TagRecord: Codable {
    let tagName: String
    let countTag: Int
}
