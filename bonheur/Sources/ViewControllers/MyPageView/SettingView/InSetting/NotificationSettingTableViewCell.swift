//
//  NotificationSettingTableViewCell.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit
import SnapKit
import Then

class NotificationSettingTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "NotificationSettingTableViewCell"

    let baseView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let titleLbl = UILabel().then {
        $0.text = "제목"
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 16)
    }
    
    let contentLbl = UILabel().then {
        $0.text = "내용"
        $0.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 12)
        $0.numberOfLines = 0
    }
    
    lazy var switchControl = UISwitch().then {
        $0.isOn = true
        $0.isEnabled = true
        $0.onTintColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        $0.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectedBackgroundView = UIView()
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        self.contentView.addSubview(baseView)
        [titleLbl, contentLbl, switchControl].forEach {
            baseView.addSubview($0)
        }
    }
    
    func setUpConstraint() {
        
        baseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(16)
        }
        contentLbl.snp.makeConstraints {
            $0.top.equalTo(titleLbl.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(31)
        }
        switchControl.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalTo(titleLbl)
        }
    }
    
    @objc func handleSwitchAction(sender: UISwitch) {
        if sender.isOn {
        print("알림켜짐")
            UIApplication.shared.registerForRemoteNotifications()
        } else {
            UIApplication.shared.unregisterForRemoteNotifications()
            print("알림꺼짐")
        }
    }
}
