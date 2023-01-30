//
//  EmailStackView.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/12.
//

import UIKit

class EmailStackView: UIStackView {
    private var emailLoginLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일로 로그인"
        label.font = UIFont(name: "SFPro-Regular", size: 12)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 0.872, green: 0.971, blue: 0.704, alpha: 1)
    
        return label
    }()
    
    private var emailRegisterLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일로 회원가입"
        label.font = UIFont(name: "SFPro-Regular", size: 12)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 0.872, green: 0.971, blue: 0.704, alpha: 1)

        return label
    }()
    
    init() {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [emailLoginLabel, emailRegisterLabel].forEach {
            self.addArrangedSubview($0)
        }
        
        self.spacing = 1
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .fill

        self.backgroundColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
