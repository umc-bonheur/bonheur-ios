//
//  StatsView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class StatsView: UIView {
    
    let statsByMonthView = StatsByMonthView()
    let statsByDayOfTheWeekView = StatsByDayOfTheWeekView()
    let statsByHourView = StatsByHourView()
    let statsByTagView = StatsByTagView()
    
    let statsTitleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "돌아보기", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 20)
    }
    
    let mainView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.928, green: 1, blue: 0.821, alpha: 1)
        $0.layer.cornerRadius = 15
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        [statsTitleLbl, mainView].forEach {
            addSubview($0)
        }
        [statsByMonthView, statsByDayOfTheWeekView, statsByHourView, statsByTagView].forEach {
            mainView.addSubview($0)
        }
    }
    
    func setUpConstraints() {
        
        statsTitleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(16)
        }
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(statsTitleLbl.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(105)
        }
        
        statsByMonthView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        statsByDayOfTheWeekView.snp.makeConstraints {
            $0.top.equalTo(statsByMonthView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        statsByHourView.snp.makeConstraints {
            $0.top.equalTo(statsByDayOfTheWeekView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        statsByTagView.snp.makeConstraints {
            $0.top.equalTo(statsByHourView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
