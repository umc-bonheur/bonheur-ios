//
//  OnboardingViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // back button
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 폰트 두껍게 20
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // title
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나만의 작은 행복 보관함"
        label.font = UIFont(name: "NanumSquareRoundOTFEB", size: 16)
        
        return label
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "bonheur"
        label.font = UIFont(name: "NanumSquareRoundOTFEB", size: 48)
        
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [subTitleLabel, titleLabel])
        st.axis = .vertical
        st.distribution = .fill
        st.alignment = .center
        
        return st
    }()
    
    // logo
    private var logoImageView = UIImageView(image: UIImage(named: "AppLogo"))
    
    // oauth
    private lazy var kakaoLoginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        var title = "카카오톡으로 시작하기"
        config.title = title
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont(name: "SFPro-Bold", size: 16)!]))
        config.image = UIImage(named: "KakaoTalkLogo")
        config.imagePlacement = .leading
        config.imagePadding = 12
        config.baseBackgroundColor = UIColor(red: 0.996, green: 0.898, blue: 0, alpha: 1)
        config.baseForegroundColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        
        config.background.cornerRadius = 13
        config.cornerStyle = .fixed
        
        return UIButton(configuration: config)
    }()
    
    private lazy var appleLoginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        var title = "Apple로 시작하기"
        config.title = title
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont(name: "SFPro-Bold", size: 16)!]))
        config.image = UIImage(named: "AppleLogo")
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        
        config.background.cornerRadius = 13
        config.cornerStyle = .fixed
        
        return UIButton(configuration: config)
    }()
    
    lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        st.spacing = 12
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill

        return st
    }()
    
    // email
    private var emailLoginLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일로 로그인"
        label.font = UIFont(name: "SFPro-Regular", size: 12)
        label.textAlignment = .center
        label.backgroundColor = .lightGreen
        
        return label
    }()
    
    private var emailRegisterLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일로 회원가입"
        label.font = UIFont(name: "SFPro-Regular", size: 12)
        label.textAlignment = .center
        label.backgroundColor = .lightGreen
        
        return label
    }()

    lazy var emailStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailLoginLabel, emailRegisterLabel])
        st.spacing = 1
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .fill
        
        st.backgroundColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        
        return st
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeAutoLayout()
    }
    
    func setup() {
        view.addSubview(backButton)
        view.addSubview(titleStackView)
        view.addSubview(logoImageView)
        view.addSubview(buttonStackView)
        view.addSubview(emailStackView)
        
        view.backgroundColor = .lightGreen
    }

    func makeAutoLayout() {
        // 뒤로 가기 버튼
        backButton.translatesAutoresizingMaskIntoConstraints = false // 자동적으로 할당된 오토레이아웃 해제
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // 소셜로그인 버튼 스택 뷰
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 46)
        ])

        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appleLoginButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        // 로고 이미지
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -36)
        ])
        
        // 제목 스택 뷰
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -36)
        ])
        
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailStackView.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor),
            emailStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 32)
        ])
        
    }
        
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil) // 전 화면으로 돌아가기
    }

}
