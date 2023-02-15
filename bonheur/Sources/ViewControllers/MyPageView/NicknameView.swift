//
//  NicknameView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class NicknameView: UIView {
    
    private let profileFrameView = UIView().then {
        $0.backgroundColor = UIColor(named: "main-light")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 116 / 2.0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    var profileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile-clover")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var nicknameLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.font = UIFont(name: "SFPro-Medium", size: 16)
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.textAlignment = .center
    }
    
    let editNicknameImageView = UIImageView().then {
        $0.image = UIImage(named: "pencil")
    }
    
    lazy var editNicknameBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let borderView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1)
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
        
        [profileFrameView, nicknameLbl, editNicknameBtn, borderView].forEach {
            addSubview($0)
        }
        profileFrameView.addSubview(profileImageView)
        editNicknameBtn.addSubview(editNicknameImageView)
    }
    
    func setUpConstraints() {
        
        profileFrameView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(29)
        }
        profileImageView.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 116)
            $0.width.equalTo(Constant.width * 116)
            $0.center.equalToSuperview()
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        nicknameLbl.snp.makeConstraints {
            $0.top.equalTo(profileFrameView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        editNicknameImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        editNicknameBtn.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 15)
            $0.width.equalTo(Constant.width * 15)
            $0.centerY.equalTo(nicknameLbl)
            $0.leading.equalTo(nicknameLbl.snp.trailing).offset(10.5)
        }
        borderView.snp.makeConstraints {
            $0.top.equalTo(nicknameLbl.snp.bottom).offset(32)
            $0.height.equalTo(Constant.height * 0.5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
