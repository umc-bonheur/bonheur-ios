//
//  LoginViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth
import AuthenticationServices

class LoginViewController: UIViewController {
    
    private var logoImageView = UIImageView(image: UIImage(named: "SmileClover"))
    
    private var emailStackView = EmailStackView()
    private var oauthStackView = OAuthStackView()
    private var titleStackView = TitleStackView()
    
    override func loadView() {
        super.loadView()
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeAutoLayout()
    }
    
    func setup() {        
        [titleStackView, logoImageView, oauthStackView, emailStackView].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor = UIColor(red: 0.872, green: 0.971, blue: 0.704, alpha: 1)
        
        oauthStackView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
//        oauthStackView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
    }

    func makeAutoLayout() {
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
    
    @objc func kakaoLoginButtonTapped() {
        // UserDefaluts에 sessionId 있는지 확인
        let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
        let socialType = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.socialType)
        
        if UserApi.isKakaoTalkLoginAvailable() { // 카카오톡으로 로그인
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    if sessionId != nil { // UserDefaults에 sessionId가 존재 > 로그인 API
                        self.loginWithAPI(loginRequest: LoginRequest(token: oauthToken!.accessToken, socialType: "카카오"))
                    } else { // sessionId가 존재하지 않음 > 회원가입 API
                        print("socialSignUpWithAPI - success")
                        
                        // TODO: 가입했는데 또 가입하려고 하면 resultCode는 CF002, data는 null
                        // TODO: 닉네임 입력 받기
                        self.socialSignUpWithAPI(socialSignUpRequest: SocialSignUpRequest(token: oauthToken!.accessToken, nickname: "짱제이는개발중", socialType: "카카오"))
                    }
                }
            }
        } else { // 카카오 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print(oauthToken!)
                }
            }
        }
        
        // 메인 화면으로 이동
        navigationController?.pushViewController(TabBarController(), animated: true)
    }

}

extension LoginViewController {
    func socialSignUpWithAPI(socialSignUpRequest: SocialSignUpRequest) {
        AuthAPI.shared.socialSignUp(socialSignUpRequest: socialSignUpRequest) { response in
            switch response {
            case .success(let socialSignUpData):
                // SocialSignUpResponse(sessionId: "28bbe5ef-1dc9-462f-9a60-a0f3b813b2fc", memberId: 7)
                if let data = socialSignUpData as? SocialSignUpResponse {
                    UserDefaults.standard.set(data.sessionId, forKey: Const.UserDefaultsKey.sessionId)
                    UserDefaults.standard.set(data.memberId, forKey: Const.UserDefaultsKey.memberId)
                    UserDefaults.standard.set(socialSignUpRequest.socialType, forKey: Const.UserDefaultsKey.socialType)
                }
            case .requestError(let resultCode, let message):
                print("socialSignUpWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("socialSignUpWithAPI - pathError")
            case .serverError:
                print("socialSignUpWithAPI - serverError")
            case .networkFail:
                print("socialSignUpWithAPI - networkFail")
            }
        }
    }
    
    func loginWithAPI(loginRequest: LoginRequest) {
        AuthAPI.shared.login(loginRequest: loginRequest) { response in
            switch response {
            case .success(let loginData):
                if let data = loginData as? LoginResponse {
                    UserDefaults.standard.set(data.sessionId, forKey: Const.UserDefaultsKey.sessionId)
                    UserDefaults.standard.set(data.memberId, forKey: Const.UserDefaultsKey.memberId)
                    UserDefaults.standard.set(loginRequest.socialType, forKey: Const.UserDefaultsKey.socialType)
                }
            case .requestError(let resultCode, let message):
                print("socialSignUpWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("socialSignUpWithAPI - pathError")
            case .serverError:
                print("socialSignUpWithAPI - serverError")
            case .networkFail:
                print("socialSignUpWithAPI - networkFail")
            }
        }
    }
}
