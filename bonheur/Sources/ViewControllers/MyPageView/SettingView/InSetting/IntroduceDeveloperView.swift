//
//  IntroduceDeveloperView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit
import SnapKit
import Then

class IntroduceDeveloperView: UIView {
    
    let titleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "보네르를 만든 사람들", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 24)
        $0.textAlignment = .center
    }
    
    let designTitleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "Design", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 16)
        $0.textAlignment = .center
    }
    
    let iosTitleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "iOS", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 16)
        $0.textAlignment = .center
    }
    
    let serverTitleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "Server", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 16)
        $0.textAlignment = .center
    }
    
    let designNameLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "염혜인", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let iosName1Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "김사랑", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let iosName2Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "김소현", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let iosName3Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "이정연", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let iosName4Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "임록희", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let serverName1Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "원민재", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let serverName2Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "임세환", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let serverName3Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "한다연", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let serverName4Lbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "허영은", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = .black
        $0.font = UIFont(name: "SFPro-Medium", size: 14)
        $0.textAlignment = .center
    }
    
    let designView = UIView().then {
        $0.backgroundColor = UIColor(named: "main-light")
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let iosView = UIView().then {
        $0.backgroundColor = UIColor(named: "main-light")
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let serverView = UIView().then {
        $0.backgroundColor = UIColor(named: "main-light")
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var iosNameStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 12
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    
    var serverNameStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 12
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    
    let backgroundCloverImageView = UIImageView().then {
        $0.image = UIImage(named: "background-clover")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        
        [titleLbl, designView, iosView, serverView, iosNameStackView, serverNameStackView, designNameLbl, backgroundCloverImageView].forEach {
            addSubview($0)
        }
        [iosName1Lbl, iosName2Lbl, iosName3Lbl, iosName4Lbl].forEach {
            iosNameStackView.addArrangedSubview($0)
        }
        [serverName1Lbl, serverName2Lbl, serverName3Lbl, serverName4Lbl].forEach {
            serverNameStackView.addArrangedSubview($0)
        }
        designView.addSubview(designTitleLbl)
        iosView.addSubview(iosTitleLbl)
        serverView.addSubview(serverTitleLbl)
    }
    
    func setUpConstraints() {
        
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.centerX.equalToSuperview()
        }
        
        // Design
        designView.snp.makeConstraints {
            $0.top.equalTo(titleLbl.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Constant.height * 28)
            $0.width.equalTo(Constant.height * 134)
        }
        designTitleLbl.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        designNameLbl.snp.makeConstraints {
            $0.top.equalTo(designView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        // iOS
        iosView.snp.makeConstraints {
            $0.top.equalTo(designNameLbl.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Constant.height * 28)
            $0.width.equalTo(Constant.height * 134)
        }
        iosTitleLbl.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        iosNameStackView.snp.makeConstraints {
            $0.top.equalTo(iosView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        iosName1Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
        iosName2Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(iosName1Lbl.snp.trailing).offset(12)
        }
        iosName3Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(iosName2Lbl.snp.trailing).offset(12)
        }
        iosName4Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(iosName3Lbl.snp.trailing).offset(12)
        }
        
        // Server
        serverView.snp.makeConstraints {
            $0.top.equalTo(iosName4Lbl.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Constant.height * 28)
            $0.width.equalTo(Constant.height * 134)
        }
        serverTitleLbl.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        serverNameStackView.snp.makeConstraints {
            $0.top.equalTo(serverView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        serverName1Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
        serverName2Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(serverName1Lbl.snp.trailing).offset(12)
        }
        serverName3Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(serverName2Lbl.snp.trailing).offset(12)
        }
        serverName4Lbl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(serverName3Lbl.snp.trailing).offset(12)
        }
        backgroundCloverImageView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
        }
    }
}
