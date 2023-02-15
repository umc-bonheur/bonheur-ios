//
//  CountCloverView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class CountCloverView: UIView {
    
    var countDaysLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 20)
    }
    
    let periodLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "일동안", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 20)
    }
    
    var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 24
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    
    // MARK: found
    let foundView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    var foundStackView = UIStackView().then {
        $0.alignment = .center
        $0.distribution = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    let foundImageView = UIImageView().then {
        $0.image = UIImage(named: "clover")
        $0.contentMode = .scaleAspectFit
    }
    
    let found1Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
    }
    
    let found2Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "개의 행복을", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
        let attributtedString = NSMutableAttributedString(string: $0.text!)
        attributtedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1), range: ($0.text! as NSString).range(of: "개"))
        $0.attributedText = attributtedString
    }
    
    let found3Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "찾았어요", attributes: [NSAttributedString.Key.kern: 0.03])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 10)
    }
    
    // MARK: made
    let madeView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    var madeStackView = UIStackView().then {
        $0.alignment = .center
        $0.distribution = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    let madeImageView = UIImageView().then {
        $0.image = UIImage(named: "clover")
        $0.contentMode = .scaleAspectFit
    }
    
    let made1Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
    }
    
    let made2Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "개의 해시태그를", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
        let attributtedString = NSMutableAttributedString(string: $0.text!)
        attributtedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1), range: ($0.text! as NSString).range(of: "개"))
        $0.attributedText = attributtedString
    }
    
    let made3Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "만들었어요", attributes: [NSAttributedString.Key.kern: 0.03])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 10)
    }
    
    // MARK: recorded
    let recordedView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    var recordedStackView = UIStackView().then {
        $0.alignment = .center
        $0.distribution = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    let recordedImageView = UIImageView().then {
        $0.image = UIImage(named: "clover")
        $0.contentMode = .scaleAspectFit
    }
    
    let recorded1Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
    }
    
    let recorded2Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "일동안 행복을", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
        let attributtedString = NSMutableAttributedString(string: $0.text!)
        attributtedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1), range: ($0.text! as NSString).range(of: "일동안"))
        $0.attributedText = attributtedString
    }
    
    let recorded3Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "기록했어요", attributes: [NSAttributedString.Key.kern: 0.03])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 10)
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
                
        [stackView, countDaysLbl, periodLbl].forEach {
            addSubview($0)
        }
        [foundView, madeView, recordedView].forEach {
            stackView.addArrangedSubview($0)
        }
        [foundImageView, foundStackView, found3Lbl].forEach {
            foundView.addSubview($0)
        }
        [madeImageView, madeStackView, made3Lbl].forEach {
            madeView.addSubview($0)
        }
        [recordedImageView, recordedStackView, recorded3Lbl].forEach {
            recordedView.addSubview($0)
        }
        foundStackView.addArrangedSubview(found1Lbl)
        foundStackView.addArrangedSubview(found2Lbl)
        madeStackView.addArrangedSubview(made1Lbl)
        madeStackView.addArrangedSubview(made2Lbl)
        recordedStackView.addArrangedSubview(recorded1Lbl)
        recordedStackView.addArrangedSubview(recorded2Lbl)
    }
    
    func setUpConstraints() {
        
        setUpStackViewConstraints()
        
        countDaysLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.equalToSuperview().offset(16)
        }
        periodLbl.snp.makeConstraints {
            $0.centerY.equalTo(countDaysLbl)
            $0.leading.equalTo(countDaysLbl.snp.trailing)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(periodLbl.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setUpStackViewConstraints() {
        
        // found
        foundView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
        foundStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(foundImageView.snp.bottom).offset(10)
        }
        foundImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        found1Lbl.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        found2Lbl.snp.makeConstraints {
            $0.centerY.equalTo(found1Lbl)
            $0.leading.equalTo(found1Lbl.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        found3Lbl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(foundStackView.snp.bottom).offset(4)
            $0.bottom.equalToSuperview()
        }
        
        // made
        madeView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        madeStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(madeImageView.snp.bottom).offset(10)
        }
        madeImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        made1Lbl.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        made2Lbl.snp.makeConstraints {
            $0.centerY.equalTo(made1Lbl)
            $0.leading.equalTo(made1Lbl.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        made3Lbl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(madeStackView.snp.bottom).offset(4)
            $0.bottom.equalToSuperview()
        }
        
        // recorded
        recordedView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
        }
        recordedStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(recordedImageView.snp.bottom).offset(10)
        }
        recordedImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        recorded1Lbl.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        recorded2Lbl.snp.makeConstraints {
            $0.centerY.equalTo(recorded1Lbl)
            $0.leading.equalTo(recorded1Lbl.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        recorded3Lbl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(recordedStackView.snp.bottom).offset(4)
            $0.bottom.equalToSuperview()
        }
    }
}
