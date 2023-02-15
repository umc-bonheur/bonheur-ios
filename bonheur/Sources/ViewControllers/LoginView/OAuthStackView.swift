//
//  OAuthStackView.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/12.
//

import UIKit

class OAuthStackView: UIStackView {
    // 카카오 로그인 버튼
    var kakaoLoginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        var title = "카카오톡으로 시작하기"
        config.title = title
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont(name: "SFPro-Bold", size: 16)!]))
        var imageConfig = UIImage.SymbolConfiguration(pointSize: 13)
        config.image = UIImage(systemName: "message.fill", withConfiguration: imageConfig)
        config.imagePlacement = .leading
        config.imagePadding = 12
        config.baseBackgroundColor = UIColor(red: 0.996, green: 0.898, blue: 0, alpha: 1)
        config.baseForegroundColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        
        config.background.cornerRadius = 13
        config.cornerStyle = .fixed
        
        return UIButton(configuration: config)
    }()

    // 애플 로그인 버튼
    var appleLoginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        var title = "Apple로 시작하기"
        config.title = title
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont(name: "SFPro-Bold", size: 16)!]))
        var imageConfig = UIImage.SymbolConfiguration(pointSize: 13)
        config.image = UIImage(systemName: "apple.logo", withConfiguration: imageConfig)
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        
        config.background.cornerRadius = 13
        config.cornerStyle = .fixed
        
        return UIButton(configuration: config)
    }()
    
    init() {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [kakaoLoginButton, appleLoginButton].forEach {
            self.addArrangedSubview($0)
        }
        
        self.spacing = 12
        self.axis = .vertical
        self.distribution = .fillEqually
        self.alignment = .fill
        
        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 46)
        ])

        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appleLoginButton.heightAnchor.constraint(equalToConstant: 46)
        ])

    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
