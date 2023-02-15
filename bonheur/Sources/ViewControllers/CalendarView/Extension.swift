//
//  Extension.swift
//  bonheur
//
//  Created by Rocky on 2023/01/28.
//

import UIKit
import FSCalendar

// MARK: - FSCalendar extension
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
        let imageDateFormatter = krDate.string(from: date)
        let dateString = imageDateFormatter

        let sisthCharIndex = imageDateFormatter.index(imageDateFormatter.startIndex, offsetBy: 5)
        let seventhCharIndex = imageDateFormatter.index(imageDateFormatter.startIndex, offsetBy: 6)
        
        let year = String(imageDateFormatter.prefix(4))
        let month = String(imageDateFormatter[sisthCharIndex...seventhCharIndex])
        
        // 이미지 캐싱
        if let cachedImage = imageCache[dateString] {
            return cachedImage
        }
        
        // 서버에서 데이터를 백그라운드 스레드에서 가져오기
        DispatchQueue.global(qos: .background).async {
            CalendarAPI.shared.getCalendarAPI(year: year, month: month) { (data) in
                // UI 업데이트는 메인 스레드에서 실행
                DispatchQueue.main.async {
                    self.serverData = data
                    if let data = self.serverData?.first(where: { $0["day"] as? String == dateString }) {
                        let isWrite = data["isWrite"] as? Bool ?? false
                        let image = isWrite ? UIImage(named: "DarkClover") : UIImage(named: "EmptyClover")
                        self.imageCache[dateString] = image
                        calendar.reloadData()
                    }
                }
            }
        }
        
        return nil

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

// MARK: - CollectionView Delegate, DelegateFlowLayout

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 350
        let cellHeight = 149
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - 내용입력

extension CalendarViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePostingCollectionViewCell.identifier, for: indexPath) as? HomePostingCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.backgroundView = cell.cellBackgroundView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let singleDetailViewController = SingleDetailViewController()
        singleDetailViewController.selectedIndex = indexPath.row
//        singleDetailViewController.imageArr = data
        pushView(viewController: singleDetailViewController)
    }   
}
