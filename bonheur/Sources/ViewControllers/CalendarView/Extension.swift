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
    
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        let imageDateFormatter = DateFormatter()
        let datesWithCat = ["20230103","20230105","20230107","20230109","20230111","20230114","20230117","20230122","20230123","20230124","20230125","20230126", "20230201"]
        imageDateFormatter.dateFormat = "yyyyMMdd"
        let dateStr = imageDateFormatter.string(from: date)
        return datesWithCat.contains(dateStr) ? UIImage(named: "DarkClover") : UIImage(named: "EmptyClover")
    }
    
    // TODO: 날짜 선택시 해당 날짜의 행복 기록 띄우기
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let todayDate = dateFormatter.string(from: Date())
        let selectDate = dateFormatter.string(from: date)
        
        // 오늘 날짜 선택 시 todayColor 유지
        if selectDate == todayDate {
            calendar.appearance.titleSelectionColor = todayColor
        } else {
            calendar.appearance.titleSelectionColor = .black
        }
        
//        let tempVC = MyPageViewController()
//        navigationController?.pushViewController(tempVC, animated: true)

    }
}
