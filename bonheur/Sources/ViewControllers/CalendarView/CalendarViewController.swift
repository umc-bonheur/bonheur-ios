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
    
    var calendarHeightAnchor: NSLayoutConstraint!
    var changeWeekMonthButtonAnchor: NSLayoutConstraint!
    
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
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .label
        label.text = self.headerDateFormatter.string(from: Date())
        return label
    }()

    private lazy var todayButton: UIButton = {
        let button = UIButton()
        button.setImage(CalendarIcon.todayIcon, for: .normal)
        button.addTarget(self, action: #selector(tapTodayButton), for: .touchUpInside)
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
        
        let stack = UIStackView(arrangedSubviews: [sadImageView, notiTextLabel])
        stack.axis = .vertical
        stack.spacing = 20
        sadImageView.contentMode = .scaleAspectFit
        
        let calendarButtonStackView = UIStackView(arrangedSubviews: [leftButton, rightButton, todayButton])
        calendarButtonStackView.axis = .horizontal
        calendarButtonStackView.distribution = .equalSpacing
        calendarButtonStackView.spacing = 31.0
        
        [stack, calendar ,calendarButtonStackView, headerLabel, changeWeekMonthButton].forEach {
            view.addSubview($0)
        }
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: changeWeekMonthButton.bottomAnchor, constant: 40).isActive = true
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.centerYAnchor.constraint(equalTo: calendar.calendarHeaderView.centerYAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: calendar.collectionView.leadingAnchor, constant: 18).isActive = true
        
        calendarButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        calendarButtonStackView.centerYAnchor.constraint(equalTo: calendar.calendarHeaderView.centerYAnchor).isActive = true
        calendarButtonStackView.trailingAnchor.constraint(equalTo: calendar.collectionView.trailingAnchor, constant: -18).isActive = true
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendarHeightAnchor = calendar.heightAnchor.constraint(equalToConstant: 435)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calendarHeightAnchor,
            calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
        ])
        
        changeWeekMonthButton.translatesAutoresizingMaskIntoConstraints = false
        changeWeekMonthButtonAnchor = changeWeekMonthButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: -20)
        
        NSLayoutConstraint.activate([
            changeWeekMonthButtonAnchor,
            changeWeekMonthButton.centerXAnchor.constraint(equalTo: calendar.centerXAnchor)
        ])
        
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
        
        calendar.appearance.headerTitleColor = .clear
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.weekdayFont = UIFont(name: "SFPro-Regular", size: 14)
        calendar.appearance.titleFont = UIFont(name: "SFPro-Regular", size: 14)
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.placeholderType = .none
        calendar.appearance.selectionColor = .clear
        calendar.appearance.titleSelectionColor = .black
        calendar.appearance.imageOffset = CGPoint(x: 0, y: -45)
        calendar.appearance.todayColor = .clear
        calendar.appearance.titleTodayColor = UIColor(red: 94/255, green: 156/255, blue: 3/255, alpha: 1)
        calendar.weekdayHeight = 30
    }
    
    func getNextMonth(date: Date) -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: date)!
    }
    
    func getPreviousMonth(date: Date) -> Date {
      return Calendar.current.date(byAdding: .month, value: -1, to: date)!
    }
    
    // MARK: - Selector
    
    @objc func tapTodayButton() {
        calendar.select(.now)
    }
    
    @objc func tapNextMonth() {
        self.calendar.setCurrentPage(getNextMonth(date: calendar.currentPage), animated: true)
    }

    @objc func tapBeforeMonth() {
        self.calendar.setCurrentPage(getPreviousMonth(date: calendar.currentPage), animated: true)
    }
    
    @objc func tapChangeMonth() {
        if self.calendar.scope == .month {
            self.calendar.setScope(.week, animated: true)
            self.changeWeekMonthButton.setImage(CalendarIcon.downIcon, for: .normal)
            calendar.appearance.imageOffset = CGPoint(x: 0, y: 0)
            calendar.weekdayHeight = 15
            changeWeekMonthButtonAnchor.constant = -3
        }
        
        else {
            self.calendar.setScope(.month, animated: true)
            self.changeWeekMonthButton.setImage(CalendarIcon.upIcon, for: .normal)
            calendar.appearance.imageOffset = CGPoint(x: 0, y: -45)
            calendar.weekdayHeight = 30
            changeWeekMonthButtonAnchor.constant = -20
        }
    }
}

// MARK: - Extension

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
        let datesWithCat = ["20230103","20230105","20230107","20230109","20230111","20230114","20230117","20230122","20230123","20230124","20230125","20230126"]
        imageDateFormatter.dateFormat = "yyyyMMdd"
        let dateStr = imageDateFormatter.string(from: date)
        return datesWithCat.contains(dateStr) ? UIImage(named: "DarkClover") : UIImage(named: "EmptyClover")
    }
    
    // TODO: 날짜 선택시 해당 날짜의 행복 기록 띄우기
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // https://icksw.tistory.com/122
        
        let tempVC = MyPageViewController()
        navigationController?.pushViewController(tempVC, animated: true)
    }
}
