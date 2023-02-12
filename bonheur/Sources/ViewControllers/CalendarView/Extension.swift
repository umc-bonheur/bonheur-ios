//
//  Extension.swift
//  bonheur
//
//  Created by Rocky on 2023/01/28.
//

import UIKit
import FSCalendar

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightAnchor.constant = bounds.height
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        let currentPage = calendar.currentPage
        headerLabel.text = headerDateFormatter.string(from: currentPage)
    }
    
    
    // TODO: - 서버에서 행복기록 날짜별로 작성여부 데이터 값 받아서 isWrite가 true일 경우 clover 이미지 변경하기
    // TODO: - API에서 day랑 isWrite를 받아온다.
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {

        let imageDateFormatter = krDate.string(from: date)
        
        let sisthCharIndex = imageDateFormatter.index(imageDateFormatter.startIndex, offsetBy: 5)
        let seventhCharIndex = imageDateFormatter.index(imageDateFormatter.startIndex, offsetBy: 6)

        let year = String(imageDateFormatter.prefix(4))
        let month = String(imageDateFormatter[sisthCharIndex...seventhCharIndex])
        let day = String(imageDateFormatter.suffix(2))
        
        var comeClosure: [[String: Any]] = [[:]]
       
        CalendarAPI.shared.getCalendarAPI(year: year, month: month, day: day) { param in
//            let data = param
//            guard let day = Int(day) else { return }
//            let temp = data[day - 1]
            
            comeClosure = param
            return comeClosure
        }
        
            print(comeClosure)
        
//        print("\(year)년", terminator: " ")ㄱ
//        print("\(month)월", terminator: " ")
//        print("\(day)일")
        
        
        
        
        let datesWithCat = ["2023-02-01", "2023-02-07"]
        let dateStr = imageDateFormatter
        return datesWithCat.contains(dateStr) ? UIImage(named: "DarkClover") : UIImage(named: "EmptyClover")
    }
    
    // TODO: 날짜 선택시 해당 날짜의 행복 기록 띄우기
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let todayDate = krDate.string(from: Date())
        let selectDate = krDate.string(from: date)
        
        // 오늘 날짜 선택 시 todayColor 유지
        if selectDate == todayDate {
            calendar.appearance.titleSelectionColor = bonheurTodayColor
        } else {
            calendar.appearance.titleSelectionColor = bonheurTodayColor
        }
    }
    
    
}
