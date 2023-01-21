//
//  CalendarViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    // MARK: - Constant
    
    struct CalendarIcon {
        static let downIcon = UIImage(named: "down")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
        static let upIcon = UIImage(named: "up")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
        static let leftIcon = UIImage(named: "left")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
        static let rightIcon = UIImage(named: "right")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
        static let todayIcon = UIImage(named: "today")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
    }
    
    
    private var sadImageView = UIImageView(image: UIImage(named: "SadClover"))
    
    // MARK: - Property
    
    private var calendarHeightAnchor: NSLayoutConstraint!

    
    let headerDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 MM월"
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(identifier: "KST")
        return formatter
    }()
    
    // MARK: - UI
    
    fileprivate weak var calendar: FSCalendar!
    
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
    
    private lazy var headerLabel: UILabel = {
        //guard let self = self else { return }
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .label
        label.text = self.headerDateFormatter.string(from: Date())
        return label
    }()

    private lazy var todayButton: UIButton = {
        let button = UIButton()
        button.setImage(CalendarIcon.todayIcon, for: .normal)
        //button.addTarget(self, action: #selector(tapBeforeWeek), for: .touchUpInside)
        return button
    }()
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(CalendarIcon.leftIcon, for: .normal)
        button.addTarget(self, action: #selector(tapBeforeMonth), for: .touchUpInside)
        return button
    }()


    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setImage(CalendarIcon.rightIcon, for: .normal)
        button.addTarget(self, action: #selector(tapNextMonth), for: .touchUpInside)
        return button
    }()
    
    private lazy var changeWeekMonthButton: UIButton = {
        let button = UIButton()
        button.setImage(CalendarIcon.upIcon, for: .normal)
        button.addTarget(self, action: #selector(tapChangeMonth), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCalendar()
        configureUI()
        configureNavBar()
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        // 슬픈 클로버 이미지
//        view.addSubview(sadImageView)
//        sadImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            sadImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            sadImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -172.8)
//        ])
//
//        // 알림 레이블
//        view.addSubview(notiTextLabel)
//        notiTextLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            notiTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            notiTextLabel.topAnchor.constraint(equalTo: sadImageView.bottomAnchor, constant: 16)
//        ])
        
        
        let calendarButtonStackView = UIStackView(arrangedSubviews: [leftButton, rightButton, todayButton])
        calendarButtonStackView.axis = .horizontal
        calendarButtonStackView.distribution = .equalSpacing
        calendarButtonStackView.spacing = 31.0
        
        [calendar ,calendarButtonStackView, headerLabel, changeWeekMonthButton].forEach {
            view.addSubview($0)
        }
        
        
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.centerYAnchor.constraint(equalTo: calendar.calendarHeaderView.centerYAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: calendar.collectionView.leadingAnchor, constant: 18).isActive = true
        
        calendarButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        calendarButtonStackView.centerYAnchor.constraint(equalTo: calendar.calendarHeaderView.centerYAnchor).isActive = true
        calendarButtonStackView.trailingAnchor.constraint(equalTo: calendar.collectionView.trailingAnchor, constant: -18).isActive = true
    
        // 오토레이아웃
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendarHeightAnchor = calendar.heightAnchor.constraint(equalToConstant: 475)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calendarHeightAnchor,
            calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
        ])
        
        
        changeWeekMonthButton.translatesAutoresizingMaskIntoConstraints = false
        changeWeekMonthButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 5).isActive = true
        changeWeekMonthButton.centerXAnchor.constraint(equalTo: calendar.centerXAnchor).isActive = true
        
    }
    
    
    func configureNavBar() {
        self.navigationItem.title = "오늘의 행복"
        
        let backButton = UIBarButtonItem()
        backButton.tintColor = .black
        backButton.width = 30
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "SFPro-Bold", size: 16), size: 16)]
    }
    
    
    func configureCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
        view.addSubview(calendar)
        self.calendar = calendar
        
        
        // headerTitle 투명하게
        calendar.appearance.headerTitleColor = .clear
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0

        
        self.calendar.appearance.weekdayFont = UIFont(name: "SFPro-Regular", size: 14)
        self.calendar.appearance.titleFont = UIFont(name: "SFPro-Regular", size: 14)

        
        self.calendar.placeholderType = .none
        
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.todayColor = UIColor.orange

        
        calendar.today = nil
        
        
    }
    
    
    func getNextMonth(date: Date) -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: date)!
    }
    
    func getPreviousMonth(date: Date) -> Date {
      return Calendar.current.date(byAdding: .month, value: -1, to: date)!
    }
    
    
    // MARK: - Selector
    
    @objc func tapTodayButton() {
        
    }
    
    @objc func tapNextMonth() {
        print("다음 달 버튼 클릭됨")
        self.calendar.setCurrentPage(getNextMonth(date: calendar.currentPage), animated: true)
    }

    @objc func tapBeforeMonth() {
        print("이전 달 버튼 클릭됨")
        self.calendar.setCurrentPage(getPreviousMonth(date: calendar.currentPage), animated: true)
    }
    
    @objc func tapChangeMonth() {
        if self.calendar.scope == .month {
            print("week로 변경")
            self.calendar.setScope(.week, animated: true)
            self.changeWeekMonthButton.setImage(CalendarIcon.downIcon, for: .normal)
        }
        
        else {
            print("month로 변경")
            self.calendar.setScope(.month, animated: true)
            self.changeWeekMonthButton.setImage(CalendarIcon.upIcon, for: .normal)
        }
        
    }
    
}


// MARK: - Extension FSCalendar

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
        let datesWithCat = ["20230103","20230105","20230107","20230109","20230111","20230114"]
        imageDateFormatter.dateFormat = "yyyyMMdd"
        let dateStr = imageDateFormatter.string(from: date)
        print("date : \(dateStr)")
        return datesWithCat.contains(dateStr) ? UIImage(named: "DarkClover") : UIImage(named: "EmptyClover")
    }
    
    
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

