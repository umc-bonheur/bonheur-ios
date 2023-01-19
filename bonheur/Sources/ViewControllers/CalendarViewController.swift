//
//  CalendarViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    private var sadImageView = UIImageView(image: UIImage(named: "SadClover"))
    
    let notiTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 202, height: 78)
        label.text = "행복 기록이 없어요."
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont(name: "SFPro-Regular", size: 16)
        label.textColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1)
        return label
    }()
    
    fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupCalendar()
        setup()
    }
    
    func setup() {
        view.backgroundColor = .white
        
        // 슬픈 클로버 이미지
        view.addSubview(sadImageView)
        sadImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sadImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sadImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -172.8)
        ])
        
        // 알림 레이블
        view.addSubview(notiTextLabel)
        notiTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notiTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notiTextLabel.topAnchor.constraint(equalTo: sadImageView.bottomAnchor, constant: 16)
        ])
    }
    
    
    func setupNavBar() {
        self.navigationItem.title = "오늘의 행복"
        
        let backButton = UIBarButtonItem()
        backButton.tintColor = .black
        backButton.width = 30
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "SFPro-Bold", size: 16), size: 16)]
    }
    
    
    func setupCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
        view.addSubview(calendar)
        self.calendar = calendar
        
        //calendar.appearance.headerTitleColor = .clear
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        
        // 지우기
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerTitleFont = UIFont(name: "SFPro-Bold", size: 16)
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.appearance.headerTitleOffset = CGPoint(x: 0, y: -10)
        //calendar.appearance.headerTitleAlignment = .left
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0

        
        self.calendar.appearance.weekdayFont = UIFont(name: "SFPro-Regular", size: 14)
        self.calendar.appearance.titleFont = UIFont(name: "SFPro-Regular", size: 14)
        
        
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.todayColor = UIColor.orange
        
        
        
        
        // 오토레이아웃
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calendar.heightAnchor.constraint(equalToConstant: 275),
            calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
        ])
    }
    
    
}


extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    // TODO: 날짜 선택시 해당 날짜의 행복 기록 띄우기
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // https://icksw.tistory.com/122
        
        let tempVC = MyPageViewController()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        //tempVC.date = dateFormatter.string(from: date)
        
        navigationController?.pushViewController(tempVC, animated: true)

        //self.present(tempVC, animated: true, completion: nil)
    }
    
}

