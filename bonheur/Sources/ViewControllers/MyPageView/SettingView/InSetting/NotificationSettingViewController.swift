//
//  NotificationSettingViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit
import SnapKit
import Then

class NotificationSettingViewController: UIViewController {
    
    let mainView = NotificationSettingView()
    
    var titleArr: [String] = ["행복기록 작성하기", "행복기록 돌아보기"]
    var contentArr: [String] = ["ex.[PM 21:00] 오늘은 어떤 행복한 일이 있었나요?", "ex. 1년전 이런 행복한 일이 있었어요!"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // 네비게이션 바 커스텀
        self.navigationItem.title = "푸쉬 알림"

        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        self.view.addSubview(mainView)
    }
    
    func setUpConstraints() {
        
        mainView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension NotificationSettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationSettingTableViewCell", for: indexPath) as! NotificationSettingTableViewCell
        cell.titleLbl.text = titleArr[indexPath.row]
        cell.contentLbl.text = contentArr[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.section).")
    }
}

public extension UITableView {
    
        func isLast(for indexPath: IndexPath) -> Bool {
        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1
        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
}

class NotificationSettingView: UIView {

    let tableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.register(NotificationSettingTableViewCell.self, forCellReuseIdentifier: NotificationSettingTableViewCell.cellIdentifier)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    
        // MARK: 테이블뷰 헤더 간격 없앰
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
