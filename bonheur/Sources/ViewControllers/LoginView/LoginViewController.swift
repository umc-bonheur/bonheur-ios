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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeAutoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isLogin = UserDefaults.standard.bool(forKey: Const.UserDefaultsKey.isLogin)
        let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
        
        if isLogin && sessionId != nil { // 로그인된 상태 - isLogin이 true이며 sessionId가 UserDefaults에 존재한다
            self.navigationController?.pushViewController(TabBarController(), animated: true)
        }
    }
    
    func setup() {        
        [titleStackView, logoImageView, oauthStackView, emailStackView].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor = UIColor(red: 0.872, green: 0.971, blue: 0.704, alpha: 1)
        
        oauthStackView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        oauthStackView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
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
                    UserDefaults.standard.set(oauthToken!.accessToken, forKey: Const.UserDefaultsKey.accessToken)
                    if sessionId != nil && socialType == "카카오" { // UserDefaults에 sessionId가 존재 > 로그인 API
                        print("UserDefaults에 sessionId가 존재합니다. 해당 sessionId로 로그인을 시도합니다")
                        self.loginWithAPI(loginRequest: LoginRequest(token: oauthToken!.accessToken, socialType: "카카오"))
                        self.navigationController?.pushViewController(TabBarController(), animated: true)
                    } else { // sessionId가 존재하지 않음 > 회원가입 API
                        self.socialSignUp(accessToken: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? "", socialType: "카카오")
                    }
                }
            }
        } else { // 카카오 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    if sessionId != nil && socialType == "카카오" { // UserDefaults에 sessionId가 존재 > 로그인 API
                        print("UserDefaults에 sessionId가 존재합니다. 해당 sessionId로 로그인을 시도합니다")
                        self.loginWithAPI(loginRequest: LoginRequest(token: oauthToken!.accessToken, socialType: "카카오"))
                        self.navigationController?.pushViewController(TabBarController(), animated: true)
                    } else { // sessionId가 존재하지 않음 > 회원가입 API
                        UserDefaults.standard.set(oauthToken!.accessToken, forKey: Const.UserDefaultsKey.accessToken)
                        self.socialSignUp(accessToken: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? "", socialType: "카카오")
                    }
                }
            }
        }
    }
    
    @objc func appleLoginButtonTapped() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func socialSignUp(accessToken: String, socialType: String) {
        print("회원가입 진행을 위해 프로필 설정 화면으로 이동합니다.")
        let profileSettingViewController = ProfileSettingViewController()
        profileSettingViewController.accessToken = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? ""
        profileSettingViewController.socialType = socialType
        self.navigationController?.pushViewController(profileSettingViewController, animated: true)
    }
}

extension LoginViewController {
    func loginWithAPI(loginRequest: LoginRequest) {
        AuthAPI.shared.login(loginRequest: loginRequest) { response in
            switch response {
            case .success(let loginData):
                if let data = loginData as? LoginResponse {
                    UserDefaults.standard.set(loginRequest.socialType, forKey: Const.UserDefaultsKey.socialType)
                    UserDefaults.standard.set(data.sessionId, forKey: Const.UserDefaultsKey.sessionId)
                    UserDefaults.standard.set(data.memberId, forKey: Const.UserDefaultsKey.memberId)
                    UserDefaults.standard.set(Date(), forKey: Const.UserDefaultsKey.updatedAt)
                    UserDefaults.standard.set(true, forKey: Const.UserDefaultsKey.isLogin)
                }
            case .requestError(let resultCode, let message):
                print("loginWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("loginWithAPI - pathError")
            case .serverError:
                print("loginWithAPI - serverError")
            case .networkFail:
                print("loginWithAPI - networkFail")
            }
        }
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    // Apple 로그인을 모달 시트로 표시
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    // Apple ID 연동 성공
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName // 최초 1회만 보임
            let nickname = (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
            
            let authorizationCode = appleIDCredential.authorizationCode
            let identityToken = appleIDCredential.identityToken
            let authString = String(data: authorizationCode ?? Data(), encoding: .ascii)
            let tokenString = String(data: identityToken ?? Data(), encoding: .ascii)
            
            print("Apple userIdentifier: \(userIdentifier)")
            print("Apple user name: \(nickname)")
            print("authorizationCode: \(authString!)")
            print("identityToken: \(tokenString!)")
            
            UserDefaults.standard.set(tokenString!, forKey: Const.UserDefaultsKey.accessToken)
            self.socialSignUp(accessToken: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken) ?? "", socialType: "애플")
            
        // iCloud KeyChain credential을 사용하여 sign in
        case let passwordCredential as ASPasswordCredential:
            let username = passwordCredential.user
            let password = passwordCredential.password
        default:
            break
        }
    }
    
    // Apple ID 연동 실패
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple ID 연동 error: \(error)")
    }
}
