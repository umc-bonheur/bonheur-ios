//
//  OnboardingViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // 뒤로 가기 버튼
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 폰트 두껍게 20
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var logoImageView = UIImageView(image: UIImage(named: "AppLogo"))
    
    private var emailStackView = EmailStackView()
    private var oauthStackView = OAuthStackView()
    private var titleStackView = TitleStackView()
    
    override func loadView() {
        super.loadView()
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        // TODO: Login 단계에서 UserDefaults 저장하기
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn") as Bool
        
        if isLoggedIn == true {
            navigationController?.pushViewController(HomeViewController(), animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeAutoLayout()
    }
    
    func setup() {        
        [backButton, titleStackView, logoImageView, oauthStackView, emailStackView].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor = UIColor(red: 0.872, green: 0.971, blue: 0.704, alpha: 1)
    }

    func makeAutoLayout() {
        backButton.translatesAutoresizingMaskIntoConstraints = false // 자동적으로 할당된 오토레이아웃 해제
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // 제목 스택 뷰
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -36)
        ])
        
        // 로고 이미지
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -36)
        ])
        
        // 소셜로그인 버튼 스택 뷰
        oauthStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oauthStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            oauthStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            oauthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            oauthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        // 이메일 스택 뷰
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailStackView.widthAnchor.constraint(equalTo: oauthStackView.widthAnchor),
            emailStackView.topAnchor.constraint(equalTo: oauthStackView.bottomAnchor, constant: 32)
        ])
        
    }
        
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil) // 전 화면으로 돌아가기
    }

}
