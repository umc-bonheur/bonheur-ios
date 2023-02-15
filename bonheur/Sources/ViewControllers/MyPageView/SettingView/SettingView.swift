//
//  SettingView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit
import SnapKit
import Then

class SettingView: UIView {
    
    // 알림 설정
    let notifBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let notifLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "알림 설정", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 16)
    }
    
    let notifImageView = UIImageView().then {
        $0.image = UIImage(named: "arrow-right-small")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let firstRowBorderView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
    }
    
    // 피드백 보내기
    let feedbackBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let feedbackLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "개발자에게 피드백 보내기", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 16)
    }
    
    let feedbackImageView = UIImageView().then {
        $0.image = UIImage(named: "arrow-right-small")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 앱스토어 리뷰 작성
    let reviewBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let reviewLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "앱스토어 평점 / 리뷰 작성", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 16)
    }
    
    let reviewImageView = UIImageView().then {
        $0.image = UIImage(named: "arrow-right-small")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let secondRowBorderView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
    }
    
    // 인스타그램
    let instagramBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let instagramLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "인스타그램", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 16)
    }
    
    let instagramImageView = UIImageView().then {
        $0.image = UIImage(named: "arrow-right-small")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 개발자 소개
    let developerIntroductionBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let developerIntroductionLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "개발자 소개", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 16)
    }
    
    let developerIntroductionImageView = UIImageView().then {
        $0.image = UIImage(named: "arrow-right-small")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 뷰 하단 UI Components
    let logOutBtn = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 14)
        $0.setTitleColor(UIColor(red: 1, green: 0.341, blue: 0.196, alpha: 1), for: .normal)
    }
    
    var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    
    let privacyPolicyBtn = UIButton().then {
        $0.setTitle("개인정보처리방침", for: .normal)
        $0.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 10)
        $0.setTitleColor(UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1), for: .normal)
    }
    
    let firstColumnBorderView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
    }
    
    let termsOfServiceBtn = UIButton().then {
        $0.setTitle("서비스이용약관", for: .normal)
        $0.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 10)
        $0.setTitleColor(UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1), for: .normal)
    }
    
    let secondColumnBorderView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
    }
    
    let withdrawalBtn = UIButton().then {
        $0.setTitle("회원탈퇴", for: .normal)
        $0.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 10)
        $0.setTitleColor(UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1), for: .normal)
    }
    
    let versionLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "v1.0.0", attributes: [NSAttributedString.Key.kern: 0.03])
        $0.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 10)
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
        
        [notifBtn, firstRowBorderView, feedbackBtn, reviewBtn, secondRowBorderView, instagramBtn, developerIntroductionBtn, logOutBtn, stackView, versionLbl].forEach {
            addSubview($0)
        }
        notifBtn.addSubview(notifLbl)
        notifBtn.addSubview(notifImageView)
        feedbackBtn.addSubview(feedbackLbl)
        feedbackBtn.addSubview(feedbackImageView)
        reviewBtn.addSubview(reviewLbl)
        reviewBtn.addSubview(reviewImageView)
        instagramBtn.addSubview(instagramLbl)
        instagramBtn.addSubview(instagramImageView)
        developerIntroductionBtn.addSubview(developerIntroductionLbl)
        developerIntroductionBtn.addSubview(developerIntroductionImageView)
        [privacyPolicyBtn, firstColumnBorderView, termsOfServiceBtn, secondColumnBorderView, withdrawalBtn].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    func setUpConstraints() {
        
        setUpBottomViewConstraints()
        
        notifBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(29)
            $0.height.equalTo(Constant.height * 26)
            $0.leading.trailing.equalToSuperview()
        }
        notifLbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        notifImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24.3)
        }
        firstRowBorderView.snp.makeConstraints {
            $0.top.equalTo(notifBtn.snp.bottom).offset(32)
            $0.height.equalTo(Constant.height * 0.5)
            $0.leading.trailing.equalToSuperview()
        }
        feedbackBtn.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 26)
            $0.top.equalTo(firstRowBorderView.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
        }
        feedbackLbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        feedbackImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24.3)
        }
        reviewBtn.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 26)
            $0.top.equalTo(feedbackBtn.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        reviewLbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        reviewImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24.3)
        }
        secondRowBorderView.snp.makeConstraints {
            $0.top.equalTo(reviewBtn.snp.bottom).offset(32)
            $0.height.equalTo(Constant.height * 0.5)
            $0.leading.trailing.equalToSuperview()
        }
        instagramBtn.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 26)
            $0.top.equalTo(secondRowBorderView.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
        }
        instagramLbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        instagramImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24.3)
        }
        developerIntroductionBtn.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 26)
            $0.top.equalTo(instagramBtn.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        developerIntroductionLbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        developerIntroductionImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24.3)
        }
    }
    
    func setUpBottomViewConstraints () {
        logOutBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(94)
            $0.centerX.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logOutBtn.snp.bottom).offset(17)
            $0.height.equalTo(Constant.height * 12)
            $0.width.equalTo(Constant.width * 187)
        }
        privacyPolicyBtn.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
        firstColumnBorderView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(Constant.height * 12)
            $0.width.equalTo(Constant.width * 0.5)
            $0.leading.equalTo(privacyPolicyBtn.snp.trailing).offset(9)
        }
        termsOfServiceBtn.snp.makeConstraints {
            $0.centerY.equalTo(privacyPolicyBtn)
            $0.leading.equalTo(firstColumnBorderView.snp.trailing).offset(9)
        }
        secondColumnBorderView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(Constant.height * 12)
            $0.width.equalTo(Constant.width * 0.5)
            $0.leading.equalTo(termsOfServiceBtn.snp.trailing).offset(9)
        }
        withdrawalBtn.snp.makeConstraints {
            $0.centerY.equalTo(privacyPolicyBtn)
            $0.leading.equalTo(secondColumnBorderView.snp.trailing).offset(9)
        }
        versionLbl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(stackView.snp.bottom).offset(12)
        }
    }
}
